Feature: Authorised user sets discussion privacy
  As a user who can set the privacy level
  I want to set the privacy level of my discussion to either public or private
  So I can choose who can see the discussion

  Background:

  Scenario: Discussion author sets privacy
    Given I am logged in
    And I am a member of a group
    When I create a private discussion
    Then I should see that the group is set to private

  Scenario: User views authorised discussions
    Given I am logged in
    When I visit a public group
    Then I should see public discussions
    And I should not see private discussions

  Scenario: Visitor views authorised discussions
    Given I visit a public group
    Then I should see public discussions
    And I should not see private discussions

  Scenario: Authorised user changes privacy
    Given I am logged in
    And I am a member of a group
    And there is a private discussion
    And I have the ability to set the privacy level of the discussion
    When I change the discussion privacy to public
    Then I should see that the group is set to public

  Scenario: Discussion author creates discussion in hidden group
    Given there is a hidden group
    And I create a discussion
    Then the privacy should be set to hidden
