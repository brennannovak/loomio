Feature: Discussion author sets discussion privacy
  As a discussion author
  I want to set the privacy level of my discussion to either public or private
  So I can choose who can see the discussion

  As a group coordinator
  I want to change the privacy level of discussions in my group
  So I can clean up if someone makes a mistake


  Background:
    Given I am logged in

  Scenario: Discussion author sets privacy
    Given I am a member of a group
    When I create a discussion
    And I choose to make the discussion private
    Then the discussion should be set to private
    And only group members can see the discussion

  Scenario: Discussion author changes privacy
    Given I am a member of a group
    And there is a private discussion
    When I change the discussion privacy to public
    Then anyone can see the disucssion

  Scenario:



