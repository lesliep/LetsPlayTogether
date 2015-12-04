Feature: User signup

  Scenario: Unregistered user decides to sign up
    Given I am not signed in
    When I click the 'Sign Up' button
    Then I should be taken to the 'Sign Up' page
