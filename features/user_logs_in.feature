Feature: a user wants to log in

	As a user
	I want to login
	So that I can view my dashboard
	
	Scenario: a user logs in
		Given I am registered as "user@example.com" "password"
		When I go to the logon page
		And I enter "username" into "username" field
		And I enter "password" into "password" field
		And I click the "logon" button
		Then I should be on the dashboard
		And I should see "Welcome to your dashboard."
		And I should have a status code of 200