Feature: Authorised user sets discussion privacy
  As a user who can set the privacy level
  I want to set the privacy level of my discussion to either public or private
  So I can choose who can see the discussion

  Background:
    Given I am logged in
    And I am a member of a group

  Scenario: Discussion author sets privacy
    When I create a discussion
    And I choose to make the discussion private
    Then only group members can see the discussion

  Scenario: Authorised user changes privacy
    Given there is a private discussion
    And I have the ability to set the privacy level of the discussion
    When I change the discussion privacy to public
    Then anyone can see the disucssion

  Scenario: Discussion author creates discussion in hidden group
    Given there is a hidden group
    And I create a discussion
    Then the privacy should be set to hidden
