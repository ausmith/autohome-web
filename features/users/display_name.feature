# Tests the display_name function attached to the User object
# Author:: Brian Turchyn (mailto:brian@dj-bri-t.net)
# Since 1.0.0 Sprint 2
# Added for Issue #99

@ok
@user
Feature: A user's name is displayed

	As a user
	I want to see my first name or my email
	So that I can confirm I am logged in as myself
	
	Scenario: a user logs in with no names set
		Given I am registered as "user@example.com" with password "password"
		When I logon as "user@example.com" with password "password"
		Then I should see "Hey there, user@example.com"
	
	Scenario: a user logs in with names set
		Given I am registered as "user@example.com" with password "password"
		And I set "user@example.com"s first name to "Example"
		And I set "user@example.com"s last name to "Name"
		When I logon as "user@example.com" with password "password"
		Then I should see "Hey there, Example"