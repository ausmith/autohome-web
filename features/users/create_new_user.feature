###############################################################################
# This file is part of The Autohome Project.
#
# The Autohome Project is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# The Autohome Project is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with The Autohome Project.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################

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
    And I should be on the users page
    And I should see "A message with a confirmation link has been sent to Joe Schmo at new_nonadmin_user@example.com. Joe will have to click the included link to activate their account."

  Scenario: A non-admin user attempts to sign up a new user
    Given I am registered as non-admin user "user@example.com" with password "password"
    When I logon as "user@example.com" with password "password"
    Then when I navigate to the new_user page I should get a 403 error.
