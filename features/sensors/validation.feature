Feature: Sensor validation

  As an administrator
  I want to be able to ensure my sensors are correctly configured
  So that the data I collect is accurate

  Scenario Outline: Valid name length
    Given I am registered as admin user "root@example.com" with password "password"
    And I logon as "root@example.com" with password "password"
    And at least one room exists
		And at least one node exists
		And at least one sensor type exists
    When I am on the create_sensor page
    And I fill the sensor form with "<sensor_name>"
    Then I should <action>

		Examples:
		| sensor_name                                                       | action                       					 |
    | 12345678901234567890123456789012345678901234567890123456789012345 | be on the create_sensor page  				 |
    | 1234567890123456789012345678901234567890123456789012345678901234  | be on the most recent show_sensor page |
    |                                                                   | be on the create_sensor page 					 |
    | 1                                                                 | be on the create_sensor page   				 |
    | 12                                                                | be on the most recent show_sensor page |
