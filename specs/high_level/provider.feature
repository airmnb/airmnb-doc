  Background: As a provider of Airmnb

  Scenario: User converts to provider
    When I logged in Airmnb
    And I want to publish my first activity
    Then I should be asked to provide more detailed inforation, like
    Examples:
      | Property     |
      | fullName     |
      | phone |
      | gender       |
      | dob          |
      | certificates |
      | address      |
      | phone        |
      | email        |

    Scenario: As a publisher
    Then I should be able to create an activity
    Then I should be able to modify an activity
    Then I should be able to delete an activity

