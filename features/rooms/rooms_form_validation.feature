Feature: Rooms form validation
  In order to ensure valid room data
  As a user
  I want to validate all form values during creation and editing

  Background:
    Given I am on the homepage
    And I am signed up as "email@example.com"
    And I sign in as "email@example.com"
    And I am on the new room page

  Scenario Outline: Room Name Existance and Blank Check
    When I fill in "Name" with <value>
    And I press the "Create" button
    Then I should not see "New room created"
    And I should see the error message for <errormsg>
    Examples:
      | value | errormsg |
      | "" | "a blank room name" |
      | "12" | "a short room name" |
      | "12345678901234567890123456789012345678901234567890123456789012345" | "a long room name" | 

  Scenario: Valid Room Name
    When I fill in "Name" with "Den"
    And I press the "Create" button
    Then I should see "Room was successfully created"
    And I should be on the rooms page
