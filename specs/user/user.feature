  Background: User features, related to /users/* APIs

  Scenario: As a WeApp user I should be able to login as a Airmnb user
    Given I launch the WeApp application in Wechat
    And the WeApp calls wx.login() to get the openid "my_open_id"
    When I call /login/weapp?code="my_open_id"
    Then The response should be the User object including below
    Examples:
      | prop name | value sample                         | nullable | description                                                              |
      | userid    | 9d14b945-1820-442a-adab-f248e3da2279 |          | Airmnb user id                                                           |
      | username  | superopengl                          | yes      | Airmnb user name, unique in the User table                               |
      | fullname  | Jun Shao                             | yes      | User's full name (Chinese users don't separate first name and last name) |
      | firstname | Jun                                  | yes      |                                                                          |
      | lastname  | Shao                                 | yes      |                                                                          |

  Scenario: As a WeApp user I should be able to update my Airmnb user information (profile)
    Given I launch the WeApp application in Wechat
    When I navigate to "settings/profile"
    Then I should be able to see below inputs
    And I can conditionally update them
    Examples:
      | prop name | value sample                         | readonly | description                      |
      | userid    | 9d14b945-1820-442a-adab-f248e3da2279 | yes      | Airmnb user id                   |
      | username  | superopengl                          | yes/no   | Once saved cannot change anymore |
      | fullname  | Jun Shao                             | no       |                                  |
      | firstname | Jun                                  | no       |                                  |
      | lastname  | Shao                                 | no       |                                  |
    When I click "Save" button
    Then It should "PUT" API "/user/{userid}" with the request body like below
    Examples:
      | prop name | value sample | nullable |
      | username  | superopengl  | x        |
      | fullname  | Jun Shao     | x        |
      | firstname | Jun          | x        |
      | lastname  | Shao         | x        |
