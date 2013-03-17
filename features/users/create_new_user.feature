@wip
Feature: an admin wants sign up a new user

	As an admin
	I want to sign up a new user
	So that the new user can log in
	
	Scenario: an admin user signs up a new non-admin user
		Given I am registered as admin user "root@example.com" with password "password"
		And I am not registered as "new_nonadmin_user@example.com"
		When I logon as "root@example.com" with password "password"
		And I sign up with name "Joe" "Schmo", email "new_nonadmin_user@example.com", and password "password"
		Then I should be registered as "new_nonadmin_user@example.com" and not confirmed
		And I should see "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."