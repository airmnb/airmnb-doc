  Background: As a consumer, I should be able to use the search filter page to configure the search settings
    Given As a consumer
    And I navigate to the search filter page

  Scenario: Defailed search configuration
    When The load gets loaded
    Then I should be able to see and set below items
    Examples:
      | Search item | Input      | Example         | Description                                                                                |
      | key word    | text       | music good      | Text search key word in activity's title and description                                   |
      | category    | checkboxes | edu,care        | 'education', 'care', 'public', 'coaching' ... the predefined activity categories in Airmnb |
      | agemin      | dropdown   | 5               | Baby's age. 0-12. Has to be less than or equal to agemax                                   |
      | agemax      | dropdown   | 5               | Baby's age. 0-12. Has to be greater than or equal to agemin                                |
      | startfrom   | timepicker | Apr 9, 8:00 am  | Activity starting time no early than this value                                            |
      | endbefore   | timepicker | Apr 9, 12:00 am | Activity starting time no later than this value                                            |
      | gender      | checkboxes | girl,boy        | Baby's gender                                                                              |
    Then I should be able to see "Apply" button
    Then I should be albe to see my last 10 distinct search-conditions
