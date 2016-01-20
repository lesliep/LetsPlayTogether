Feature: Editing a profile

  Scenario: User needs to change his profile
    Given I am a signed in user
    And I have a profile
    When I click 'Edit Profile'
    Then I should be taken to the 'Edit Profile' page

  Scenario: User adds a Twitch account
    Given I am a signed in user
    And I have a profile
    When I click 'Edit Profile'
    And I click the 'Add Twitch' button
    Then I should have to verify my twitch account
    And I should see the message 'Twitch account verified'
