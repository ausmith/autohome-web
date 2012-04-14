Feature: User security
  In order to protect sensitive data
  As a visitor
  I want to deny access to all pages except login and forgot password

  Scenario: Access root page as a visitor
    Given I am on the homepage
    And I am not logged in
    Then I should not be redirected
    And I should see "Email"
    And I should see "Password"

  Scenario: Access login page as a visitor
    Given I am on the sign_in page
    And I am not logged in
    Then I should not be redirected
    And I should see "Email"
    And I should see "Password"

  Scenario: Access login page as a visitor
    Given I am on the sign_in page
    And I am not logged in
    Then I should not be redirected
    And I should see "Email"
    And I should see "Password"

  Scenario: Successfully access root page as a user
    Given I am on the homepage
    And I am signed up as "email@example.com"
    When I sign in as "email@example.com"
    Then I should be redirected to /dashboard
    And I should be signed in

  Scenario: Access the login page as a user
    Given I am on the sign_in page
    And I am signed up as "email@example.com"
    When I sign in as "email@example.com"
    Then I should be redirected to /dashboard
    And I should be signed in

  Scenario: Fail to sign as user from root page
    Given I am on the homepage
    And I am signed up as "email@example.com"
    When I sign in as "failbus@example.com"
    Then I should be signed out
    And I should not be redirected

  Scenario: Fail to sign as user from sign_in page
    Given I am on the sign_in page
    And I am signed up as "email@example.com"
    When I sign in as "failbus@example.com"
    Then I should be signed out
    And I should not be redirected


