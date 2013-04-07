@data_types
Feature: Validate Data Types
  In order to understand my collected data
  As a registered user
  I want to create and manage data types

  Scenario: All valid information
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And I am on the create_data_type page
    When I enter "Celsius" in "Unit Name"
    And I enter "C" in "Shorthand"
    And I click the button "Create Data Type"
    Then I should see "Celsius"
    And I should see "Data type was successfully created."

  Scenario: Update with valid information
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And I have a data_type named "Celsius" with shorthand "C"
    And I am on the update_data_type page for "Celsius"
    When I enter "Celsius 2" in "Unit Name"
    And I enter "C2" in "Shorthand"
    And I click the button "Update Data Type"
    Then I should see "Celsius 2"
    And I should see "C2"
    And I should see "Data type was successfully updated."

  Scenario: Longhand unit DNE
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And I am on the create_data_type page
    When I enter "" in "Unit Name"
    And I enter "C" in "Shorthand"
    And I click the button "Create Data Type"
    Then I should not see "Data type was successfully created."
    And I should see "can't be blank"
    And I should see "Please review the problems below:"

  Scenario: Longhand unit too long (33 characters)
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And I am on the create_data_type page
    When I enter "123456789012345678901234567890123" in "Unit Name"
    And I enter "C" in "Shorthand"
    And I click the button "Create Data Type"
    Then I should not see "Data type was successfully created."
    And I should see "Unit name must be at most 32 characters long."
    And I should see "Please review the problems below:"

  Scenario: Shorthand unit DNE
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And I am on the create_data_type page
    When I enter "Celsius" in "Unit Name"
    And I enter "" in "Shorthand"
    And I click the button "Create Data Type"
    Then I should not see "Data type was successfully created."
    And I should see "can't be blank"
    And I should see "Please review the problems below:"

  Scenario: Shorthand unit too long (9 characters)
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And I am on the create_data_type page
    When I enter "Celsius" in "Unit Name"
    And I enter "123456789" in "Shorthand"
    And I click the button "Create Data Type"
    Then I should not see "Data type was successfully created."
    And I should see "Shorthand must be at most 8 characters long."
    And I should see "Please review the problems below:"

