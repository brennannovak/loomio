Feature: Authorised user sets discussion privacy
  As a user who can set the privacy level
  I want to set the privacy level of my discussion to either public or private
  So I can choose who can see the discussion

  Background:

  Scenario: Discussion author sets privacy
    Given I am a logged in member of a group
    And there are other group members
    When I create a private discussion
    Then only group members can see the discussion

  Scenario: Authorised user changes privacy
    Given I am logged in
    And I am a member of a group
    And there are other group members
    And there is a private discussion
    And I have the ability to set the privacy level of the discussion
    When I change the discussion privacy to public
    Then anyone can see the disucssion

  Scenario: Discussion author creates discussion in hidden group
    Given there is a hidden group
    And I create a discussion
    Then the privacy should be set to hidden
