Feature: Running in a non-git directory
  Background:
    Given I'm in a normal directory

  Scenario: Trying to run start
    When I run flow start 1234 foo
    Then I should see the error message "You are not in a git repository"

  Scenario: Trying to run finish
    When I run flow finish
    Then I should see the error message "You are not in a git repository"

