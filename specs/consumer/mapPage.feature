  Background: As a consumer, I should be able to use map feature
    Given As a consumer
    And I open the map page


  Scenario: Initial page by default search filter (when user has never set up search filter)
    When I open the map page
    Then The map should use my current geo location as the center
    And I should see the top "10" recommended activities with the rectangle of the map view
    And I should see the "Filter" button
    And I should see the "Center" button
    And I should see several activity cards as recommended activities
    And each activity card should show below information
    Examples:
      | Item    | Example           | Description                  |
      | Picture |                   | One picture for the activity |
      | title   | Funny music class |                              |
      | startat | Apr 8, 9:00 am    |                              |
      | closeat | Apr 8, 11:00 am   |                              |
      | price   | $50.0 AUD         |                              |
      | stars   | ☆☆☆☆☆             |                              |
    And I need to "GET" api ""

  Scenario: Markers on the page
    When I click any marker on the page
    Then I should see the popup balloon with below information of the activity
    Examples:
      | Property | Example                                     |
      | title    | Funny music class                           |
      | startat  | Apr 8, 9:00 am                              |
      | closeat  | Apr 8, 11:00 am                             |
      | price    | $50.0 AUD                                   |
      | stars    | ☆☆☆☆☆                                       |
      | details  | The link to the detail page of the activity |

  Scenario: "Center" button
    When I click the "Center" button
    Then The map should reset the map center with my current geo location

  Scenario: "Filter" button
    When I click the "Filter" button
    Then I should see the "Search Filter" page

  Scenario: Activity card
    When I click any activity card
    Then I should be navigated to the actiivty detail page
