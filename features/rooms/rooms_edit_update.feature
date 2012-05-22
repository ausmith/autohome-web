Feature: Editing Rooms
  In order to update room information
  As a user
  I want to be able to do that through an interface

  Background:
    Given I am signed up as "email@example.com"
    And I sign in as "email@example.com"

  Scenario: Updating a room from the Index page
    Given a room exists with title: "Den"
    And I am on the rooms page
    When I follow "Edit"
    And I fill in "Name" with "Den Update"
    And I fill in "Description" with ""
    And I press the "Update Room" button
    Then I should see "Room has been updated."
    And I should be on the room's page
    And I should see "Den Update"

  Scenario: Updating a room from the Show page
    Given a room exists with title: "Den"
    And I am on the room's page
    When I follow "Edit"
    And I fill in "Name" with "Den Update"
    And I fill in "Description" with ""
    And I press the "Update Room" button
    Then I should see "Room has been updated."
    And I should be on the room's page
    And I should see "Den Update"

  Scenario: Failing to update a room due to invalid name
    Given a room exists with title: "Den"
    And I am on the room's page
    When I follow "Edit"
    And I fill in "Name" with "F"
    And I fill in "Description" with "This will fail"
    And I press the "Update Room" button
    Then I should see "Room has not been updated."

  Scenario: Attempting to edit a room that doesn't exist
    Given a room exists with title: "Den"
    When I am on the path "/rooms/fail/edit"
    Then the page should not exist
