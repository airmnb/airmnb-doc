  Scenario: As an Airmnb user I can login
    When I start using Airmnb Web/Weapp/Mobile app
    Then I should be able to login as a local user
    And I should be able to login as a WeApp user
    And I should be able to login as a Google user
    And I should be able to login as a WeChat user
    And I should be able to login as a Facebook user

  Scenario: As an Airmnb user I can update my profile
    When I logged in Airmnb
    Then I can modify my profile (some of them can be derived from SSO)

  Scenario: As an Airmnb user I can edit my babies' profiles
    When I logged in Airmnb
    Then I can add a baby
    And I can modify baby
    And I can delete a baby

  Scenario: As an Airmnb user I can search activties
    When I logged in Airmnb
    Then I can use map to search the near by activities
    And I can set up the search conditions by
    Examples:
      | Condition  |
      | address    |
      | keyWords   |
      | category   |
      | startsFrom |
      | endsBefore |
      | gender     |
      | ageFrom    |
      | ageTo      |

  Scenario: As an Airmnb user I can book an activity
    When I logged in Airmnb
    Then I can book an activity,
    And I can cancel the slots


