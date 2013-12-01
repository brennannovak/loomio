Feature: Discussion author sets discussion privacy
  As a discussion author
  I want to set the privacy level of my discussion to either public or private
  So I can choose who can see the discussion

  As a group coordinator
  I want to change the privacy level of discussions in my group
  So I can clean up if someone makes a mistake


  Background:
    Given I am logged in
    And I belong to a group

  Scenario: Discussion author sets privacy
    When I create a discussion
    Then
