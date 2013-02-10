Feature: Validate Rooms
  In order to organize my nodes and sensors
  As a registered user
  I want to create and manage rooms

  Scenario: All valid information
    Given that I am on the create_room page
    When I enter "New Room 1" in "Name"
    And I click "Create Room"
    Then I should see "New Room 1"
    And I should see "Room was successfully created."
