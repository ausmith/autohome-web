@room
Feature: Validate Rooms
  In order to organize my nodes and sensors
  As a registered user
  I want to create and manage rooms

  Scenario: All valid information
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And I am on the create_room page
    When I enter "New Room 1" in "Name"
    And I click the button "Create Room"
    Then I should see "New Room 1"
    And I should see "Room was successfully created."

  Scenario: Name is too short (0 characters)
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And I am on the create_room page
    When I enter "" in "Name"
    And I click the button "Create Room"
    Then I should see "Please review the problems below:"
    And I should see "Name must be at least 2 characters long."

  Scenario: Name is too short (1 character)
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And I am on the create_room page
    When I enter "1" in "Name"
    And I click the button "Create Room"
    Then I should see "Please review the problems below:"
    And I should see "Name must be at least 2 characters long."

  Scenario: Name is too long (129 characters)
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And I am on the create_room page
    When I enter "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789" in "Name"
    And I click the button "Create Room"
    Then I should see "Please review the problems below:"
    And I should see "Name must be at most 128 characters long."

  Scenario: Name is not unique
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And I am on the create_room page
    When I enter "unique" in "Name"
    And I click the button "Create Room"
    And I am on the create_room page
    And I enter "unique" in "Name"
    And I click the button "Create Room"
    Then I should see "Please review the problems below:"
    And I should see "has already been taken"
