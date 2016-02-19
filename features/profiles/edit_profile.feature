Feature: Editing a profile

  Scenario: User needs to change his profile
    Given I am a signed in user
    And I have a profile
    When I click 'Edit Profile'
    Then I should be taken to the 'Edit Profile' page

  Scenario: User wants to add a Twitch account
    Given I am a signed in user
    And I have a profile
    When I click 'Edit Profile'
    Then I should see 'Add twitch'

