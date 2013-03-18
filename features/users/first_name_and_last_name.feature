@user
Feature: First and last name user field validation
  In order to easily identify users
  As another user
  I want to add first and last name fields and provide validation that protects the database

  Scenario: First name too short (0 characters)
    Given I am registered as "root@example.com" with password "password"
    And I logon as "root@example.com" with password "password"
    When I go to my profile edit page
    And I enter "" in "First name"
    And I click the button "Update"
    Then I should see "Please review the problems below"
    And I should see "First name cannot be blank."

  Scenario: First name too short (1 character)
    Given I am registered as "root@example.com" with password "password"
    And I logon as "root@example.com" with password "password"
    When I go to my profile edit page
    And I enter "A" in "First name"
    And I click the button "Update"
    Then I should see "Please review the problems below"
    And I should see "First name must be at least 2 characters long."

  Scenario: First name too long (33 characters)
    Given I am registered as "root@example.com" with password "password"
    And I logon as "root@example.com" with password "password"
    When I go to my profile edit page
    And I enter "123456789012345678901234567890123" in "First name"
    And I click the button "Update"
    Then I should see "Please review the problems below"
    And I should see "First name must be at most 32 characters long."

  Scenario: Last name too short (0 characters)
    Given I am registered as "root@example.com" with password "password"
    And I logon as "root@example.com" with password "password"
    When I go to my profile edit page
    And I enter "" in "Last name"
    And I click the button "Update"
    Then I should see "Please review the problems below"
    And I should see "Last name cannot be blank."

  Scenario: Last name too short (1 character)
    Given I am registered as "root@example.com" with password "password"
    And I logon as "root@example.com" with password "password"
    When I go to my profile edit page
    And I enter "A" in "Last name"
    And I click the button "Update"
    Then I should see "Please review the problems below"
    And I should see "Last name must be at least 2 characters long."

  Scenario: Last name too long (33 characters)
    Given I am registered as "root@example.com" with password "password"
    And I logon as "root@example.com" with password "password"
    When I go to my profile edit page
    And I enter "123456789012345678901234567890123" in "Last name"
    And I click the button "Update"
    Then I should see "Please review the problems below"
    And I should see "Last name must be at most 32 characters long."
