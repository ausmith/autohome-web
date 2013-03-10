@room
Feature: Nodes linking
  In order to see what nodes are linked to a room
  As an authorized user
  I want to be able to link and view links with nodes

  Scenario: Link a node to a room
    Given I have rooms entitled "Living Room, Master Bedroom, Basement"
    And I have nodes with MAC addresses "00:11:22:33:44:55, 01:23:45:67:89:01"
    And I am registered as "root@example.com" with password "password"
    And I logon as "root@example.com" with password "password"
    And I am on the node edit page for "00:11:22:33:44:55"
    When I check the checkboxes "Living Room, Basement"
    And I click the button "Update Node"
    Then I should see "Node was successfully updated."
    And I should see "Living Room"
    And I should see "Basement"

  Scenario: Remove a node on a room
    Given I have rooms entitled "Living Room, Master Bedroom, Basement"
    And I have nodes with MAC addresses "00:11:22:33:44:55, 01:23:45:67:89:01"
    And I have node "00:11:22:33:44:55" attached to rooms "Living Room, Basement"
    And I am registered as "root@example.com" with password "password"
    And I logon as "root@example.com" with password "password"
    And I am on the node edit page for "00:11:22:33:44:55"
    When I uncheck the checkboxes "Basement"
    And I click the button "Update Node"
    Then I should see "Node was successfully updated."
    And I should see "Living Room"
    And I should not see "Basement"
