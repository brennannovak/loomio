class AddPrivacyToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :private, :boolean, :default => true
  end
end
