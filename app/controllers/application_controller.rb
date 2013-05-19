class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from Exception do |exception|
    render_raincheck_error(exception)
  end

  rescue_from CanCan::AccessDenied do |exception|
    request.env["HTTP_REFERER"] = root_url if request.env["HTTP_REFERER"].nil?
    flash[:error] = t("error.access_denied")
    redirect_to :back
  end

  before_filter :set_locale
  before_filter :initialize_search_form

  protected

  def set_locale
    if current_user
      if current_user.language_preference.blank?
        current_user.language_preference = extract_locale_from_accept_language_header
      end
      I18n.locale = current_user.language_preference
    else
      I18n.locale = extract_locale_from_accept_language_header
    end
    if params[:locale].present? && (Translation::LOCALES.include? params[:locale])
      I18n.locale = params[:locale]
      current_user.language_preference = params[:locale] if current_user
    end
  end

  def initialize_search_form
    @search_form = SearchForm.new(current_user)
  end

  def extract_locale_from_accept_language_header
    browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first).try(:to_s)
    if Translation::LOCALES.include? browser_locale
      browser_locale
    else
      I18n.default_locale
    end
  end

  def render_raincheck_error(exception)
    if request.xhr?
      raise exception
    else
      @error_raincheck = ErrorRaincheck.new({action: action_name, controller: controller_name})
      respond_to do |format|
        format.html { render "error_rainchecks/error_page" }
        format.all  { render :nothing => true, :status => 500 }
      end
    end
  end
end
