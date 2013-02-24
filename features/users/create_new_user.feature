Feature: a user wants sign up

	As a user
	I want to sign up
	So that I can log in
	
	Scenario: a user signs up
		Given I am not registered as "user@example.com"
		When I sign up with name "Joe" "Schmo", email "user@example.com", and password "password"
		Then I should be registered as "user@example.com" and not confirmed
		And I should see "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."