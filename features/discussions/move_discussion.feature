Feature: Authorised user moves discussion
  As a user who is authorised to move a discussion
  So that I can keep organised
  I want to move discussions between subgroups

  Background: Given I am logged in

  @javascript
  Scenario: Authorised user moves a discussion from parent group to subgroup
    Given the group has a subgroup
    And I have the ability to move the discussion
    When I visit the discussion page
    And I select the move discussion link from the discussion dropdown
    And I select the destination subgroup
    And I click on move
    Then I should see the destination subgroup name in the page title

  @javascript
  Scenario: Authorised user moves a discussion from subgroup to its parent group
    Given the group has a subgroup
    And I have the ability to move the discussion
    And the subgroup has a discussion
    When I visit the discussion page
    And I select the move discussion link from the discussion dropdown
    And I select the destination parent group
    And I click on move
    Then I should not see the subgroup name in the page title

  @javascript
  Scenario: Authorised user moves a discussion between subgroups within the same parent group
    Given the group has a subgroup
    And I have the ability to move the discussion
    And the group has another subgroup with a discussion I am able to move
    When I visit the discussion page
    And I select the move discussion link from the discussion dropdown
    And I select the destination subgroup
    And I click on move
    Then I should see the destination subgroup name in the page title

  Scenario: User without the ability tries to move a discussion
    Given I am a member of a group
    And there is a discussion in the group
    And the group has a subgroup
    When I visit the discussion page
    Then I try to move the discussion but I cannot see the link

  Scenario: Authorised user tries to move a discussion from a group with no subgroups
    Given I have the ability to move the discussion
    When I visit the discussion page
    Then I try to move the discussion but I cannot see the link

  Scenario: Authorised user moves a public discussion to a hidden group
    Given I have the ability to to move the discussion
    And the group has a public discussion
    When I visit the discussion page
    And I select the move discussion link from the discussion dropdown
    And I select the destination hidden group
    Then I should see an alert telling me that the discussion will be changed to private
    And I click on move
    And I should see that the discussion is now private

