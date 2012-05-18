Feature: Rooms Index Page
  In order to have access to CRUD tasks for my rooms
  As a user
  I want to be able to see all rooms and functions on the Rooms::Index page


  Background:
    Given I am on the homepage
    And I am signed up as "email@example.com"
    And I sign in as "email@example.com"
    And I am on the rooms page

  Scenario: No rooms
    Given 0 rooms exist
    Then I should see "No rooms exist! Create one now!"
    And I should see "New"
    And I should not see "Edit"
    And I should not see "Destroy"

  Scenario: Three rooms
    Given the following room records
      | title         | description |
      | Den           |             |
      | Living Room   | A room      |
      | Bedroom       | Hi there    |
    And I am on the rooms page
    Then I should not see "No rooms exist! Create one now!"
    And I should see "New"
    And I should see "Edit"
    And I should see "Destroy"
    And I should see "Den"
    And I should see "Living Room"
    And I should see "Bedroom"
