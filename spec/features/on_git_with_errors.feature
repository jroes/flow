Feature: Running in a git directory, unhappy paths
  Background:
    Given I'm in a git repo

  Scenario: Trying to run start when not on master
    When I'm on the whatever branch
     And I run flow start 1234 foo
    Then I should see the error message "Switch to the master branch"

  Scenario: Trying to run finish when on master
    When I'm on the master branch
    When I run flow finish
    Then I should see the error message "You aren't in a feature branch"

  Scenario: Trying to run start when there are uncommitted changes
    When there are uncommitted changes
     And I run flow start 1234 foo
    Then I should see the error message "There are uncommitted changes"

