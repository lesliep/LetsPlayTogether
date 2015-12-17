Feature: Creating a profile

  Scenario: User wants to create a profile
    Given I am a signed in user
    When I click 'Create a Profile'
    Then I should be taken to the 'Create a New Profile' page

