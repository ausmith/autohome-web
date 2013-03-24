Feature: allow non-admin users to edit their own profile and admins to edit anyone's profile

	As a non-admin user
	I want to edit my profile
	So that I can update my profile
	
	As an admin user
	I want to edit a user's profile
	So that I can update that user's profile
	
	Scenario: a non-admin user edits their profile
		Given I am registered as non-admin user "nonadmin1@example.com" with password "password"
		When I logon as "nonadmin1@example.com" with password "password"
		And I go to my profile edit page
		And I enter "password_new" in "Password"
		And I enter "password_new" in "Password confirmation"
		And I click the button "Update"
		And I logout
		And I logon as "nonadmin1@example.com" with password "password_new"
		Then I should be on the dashboard

    Scenario: prevent non-admin users from editing non-admin users' profiles
		Given I am registered as non-admin user "nonadmin1@example.com" with password "password"
		And I am registered as non-admin user "nonadmin2@example.com" with password "password"
		When I logon as "nonadmin1@example.com" with password "password"
		And I go to the profile edit page of "nonadmin2@example.com"
		Then I should be on the users page
		
	Scenario: prevent non-admin users from editing admins' profiles
		Given I am registered as non-admin user "nonadmin1@example.com" with password "password"
		And I am registered as admin user "root@example.com" with password "password"
		When I logon as "nonadmin1@example.com" with password "password"
		And I go to the profile edit page of "root@example.com"
		Then I should be on the users page

	Scenario: allow admins to edit their own profile
		Given I am registered as admin user "root@example.com" with password "password"
		When I logon as "root@example.com" with password "password"
		And I go to my profile edit page
		Then I should see "Edit User"

	Scenario: allow admins to edit non-admin users' profiles
		Given I am registered as admin user "root@example.com" with password "password"
		And I am registered as non-admin user "nonadmin1@example.com" with password "password"
		When I logon as "root@example.com" with password "password"
		And I go to the profile edit page of "nonadmin1@example.com"
		Then I should see "Edit User"
		
	Scenario: allow admins to edit admins' profiles
		Given I am registered as admin user "root@example.com" with password "password"
		And I am registered as admin user "admin1@example.com" with password "password"
		When I logon as "root@example.com" with password "password"
		And I go to the profile edit page of "admin1@example.com"
		Then I should see "Edit User"