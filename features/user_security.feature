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

  @wip
  Scenario: Access root page as a user
    Given I am on the homepage

  @wip
  Scenario: Access the login page as a user
    Given I am on the sign_in page

