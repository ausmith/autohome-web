@user
Feature: a user wants to log in

  As a user
  I want to login
  So that I can view my dashboard

  @wip
  Scenario: a user logs in
    Given I am registered as "user@example.com" with password "password"
    When I logon as "user@example.com" with password "password"
    Then I should be on the dashboard
    And I should see "Welcome to your dashboard."
