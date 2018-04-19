Background: As a consumer, I should be able to check the detail of an activity and book it
Given As a consumer
And I was navigated to the "ActivityDetail" page

Scenario: After page load
When The page gets loaded
Then I should see all information of the activity
And I should see all comments to this activity
And I should see a "Book" button if I didn't book
And I should see a "Cancel" button if I have booked but didn't start yet

