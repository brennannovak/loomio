
Given(/^there are other group members$/) do
  @group.add_member! @group_member
end

When(/^I create a private discussion$/) do
  @discussion = create_discussion group: @group, private: true
end

Then(/^only group members can see the discussion$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^there is a private discussion$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have the ability to set the privacy level of the discussion$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I change the discussion privacy to public$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^anyone can see the disucssion$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^there is a hidden group$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I create a discussion$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the privacy should be set to hidden$/) do
  pending # express the regexp above with the code you wish you had
end
