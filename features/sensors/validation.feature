@wip
Feature: Sensor validation

  As an administrator
  I want to be able to ensure my sensors are correctly configured
  So that the data I collect is accurate

  Scenario: Valid name length
    Given I am registered as "user@example.com" with password "password"
    And I logon as "user@example.com" with password "password"
    And at least one node exists
    When I am on the create_sensor page
    And I fill the sensor form with valid data
    Then I should get the following sensor name validation results
      | 12345678901234567890123456789012345678901234567890123456789012345 | false |
      | 1234567890123456789012345678901234567890123456789012345678901234  | true  |
      |                                                                   | false |
      | 1                                                                 | false |
      | 12                                                                | true  |
