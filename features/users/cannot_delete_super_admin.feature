Feature: prevent deletion of super admin account

	As a registered user
	I want to not be allowed to delete the super admin account
	So that there is always a registered user to register new users
	
	Scenario: a user attempts to delete the super admin account
		Given I am registered as "user@example.com" with password "password"
		And I logon as "user@example.com" with password "password"
		When I ask to delete the super admin account
		Then I should see "Cannot delete super admin."
		And the super admin account should still exist