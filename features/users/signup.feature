Feature: User signup

  Scenario: Unregistered user decides to sign up
    Given I am not signed in
    When I click the 'Sign Up' button
    Then I should be taken to the 'Sign Up' page

  Scenario: User email already in database
    Given I am a registered user
    And I am not signed in
    When I go to sign up
    Then I should see the message 'Email has already been taken'
