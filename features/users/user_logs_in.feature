Feature: a user wants to log in

  As a user
  I want to login
  So that I can view my dashboard

  Scenario: a user successfully logs in
    Given I am registered as "user@example.com" with password "password"
    When I logon as "user@example.com" with password "password"
    Then I should be on the dashboard
    And I should see "Welcome to your dashboard."
    And a "LOGINPASS" security event should have been logged for "user@example.com"

  Scenario: a user fails to log in by entering an invalid password
    Given I am registered as "user@example.com" with password "password"
    When I logon as "user@example.com" with password "password2"
    Then I should be on the logon page
    And I should not see "Welcome to your dashboard."
    And I should see "Invalid email or password"
    And a "LOGINFAIL" security event should have been logged for "user@example.com"

  Scenario: a user fails to log in by entering an invalid email
    Given I am registered as "user@example.com" with password "password"
    When I logon as "user2@example.com" with password "password"
    Then I should be on the logon page
    And I should not see "Welcome to your dashboard."
    And I should see "Invalid email or password"
    And a "LOGINDNE" security event should have been logged with description "user2@example.com"
