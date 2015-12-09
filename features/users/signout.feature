Feature: User sign out

  Scenario: Signed in user decides to sign out
    Given I am a registered user
    And I am signed in
    When I click the 'Log Out' button
    Then I should see the message 'Successfully signed out.'
