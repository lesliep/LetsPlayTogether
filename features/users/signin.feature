Feature: User sign in

  Scenario: Registered user decides to sign in
    Given I am a registered user
    And I am not signed in
    When I fill in the correct credentials
    Then I should be signed in

  Scenario: User tries to sign in incorrectly
    Given I am a registered user
    And I am not signed in
    When I fill in the wrong credentials
    Then I should see the message 'Wrong email or password.'
