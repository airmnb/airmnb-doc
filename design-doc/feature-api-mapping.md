# 
All requests can have a header to indicate locale.
`X-AMB-LANGUAGE`: ['en', 'ch']

Response format
```
// If it's an error
{
  error: string
}

// If it's not an error
{
  message?: string
  xxxx: {} | [] // xxxx usually should be the same as the api resource name like api/1.0.0/xxxx
}

```

* Naming, camelCase

# System


* Login
  * WeApp (Weixin mini-program)
    * `GET /login/weapp`
  * Google SSO
    * `GET /login/google` 
    * `GET /login/google/callback`
  * WeChat SSO [Optional]
    * `GET /login/wechat` 
    * `GET /login/wechat/callback`
  * Facebook SSO [Optional]
    * `GET /login/facebook` 
    * `GET /login/facebook/callback`
* User management
  * Get user
    * `GET /users/{userid}`
  * Create a new user or register a local user
    * `POST /users`
  * Update user data
    * `PUT /users/{userid}`
* Logout
  * `POST /logout`
* Health check
  * `GET /health-check`
* About us information
  * `GET /about/us`
* Statistic information
  * `GET /about/stat`
* User behavior tracking
  * `POST /trackings`

# For Providers
* Provider information/profile
  * Get provider
    * `GET /providers/{providerid}`
  * Create new provider profile (promote a user to provider)
    * `POST /providers`
  * Update provider
    * `PUT /providers/{providerid}`
* Activity by a provider
  * Get all activities by a provider
    * `GET /providers/{providerid}/activities?conditions=...`
  * Get single activity
    * `GET /activities/{activityid}`
  * Create an activity
    * `POST /providers/{providerId}/activities`. Will create slots automatically.
  * Update an activity
    * `PUT /activities/{activityid}`
  * Delete an activity
    * `DELETE /activities/{activityid}` Just update status on an activity object. Syntax sugar for the `PUT`
* Slots of an activity
  * Get all slots by a activity
    * `GET /activities/{activityid}/slots?conditions=...`
  * Update a slot. Change time
    * `PUT /slots/{slotId}`
  * Delete a slot
    * `DELETE /slots/{slotId}`
* Venue of an activity
  * Get all venues by a provider
    * `GET /providers/{providerid}/venues?conditions=...`
  * Get all venues
    * `GET /venues`
  * Get single venue
    * `GET /venues/{venueid}`
  * Create a venue
    * `POST /venues`
  * Update a venue
    * `PUT /venues/{venueid}`
  * Delete a venue
    * `DELETE /venues/{venueid}`
* Booking management by provider
  * Get all bookings by a provider
    * `GET /providers/{providerid}/bookings?conditions=...`
    * `GET /providers/{providerid}/bookings/ongoing` (shorthand)
    * `GET /providers/{providerid}/bookings/closed` (shorthand)
    * `GET /providers/{providerid}/bookings` (shorthand of `/ongoing`)
  * Get all bookings under an activity
    * `GET /activities/{activityid}/bookings?conditions=...`
  * Get a booking
    * `GET /bookings/{bookingid}`
  * Update a booking, like change price to specific consumer
    * `PUT /bookings/{bookingid}`
  * Terminate a booking (refused to provide service to the consumer of the booking)
    * `DELETE /bookings/{bookingid}`
* View feedback/comments. Provider cannot create feedback nor comment on consumers' feedback
  * Get all feedbacks for this provider's activities
    * `GET /providers/{providerid}/feedbacks?conditions=...`
  * Get all feedbacks for specific activity
    * `GET /activities/{activityid}/feedbacks`


# For Consumers
* Babies of the consumer
  * Get all babies
    * `GET /users/{userid}/babies?conditions=...`
  * Get single baby
    * `GET /babies/{babyid}`
  * Create a baby
    * `POST /babies`
  * Update a baby
    * `PUT /babies/{babyid}`
  * Delete a baby
    * `DELETE /babies/{babyid}`
* Bookings
  * Get all my bookings
    * `GET /bookings?conditions=...`
    * `GET /bookings/ongoing` (shorthand)
    * `GET /bookings/closed` (shorthand)
    * `GET /bookings` (shorthand of `ongoing`)
  * Get single booking
    * `GET /bookings/{bookingid}`
  * Create a bookings of an activity. (Create a booking based on an activity)
    * `POST /activities/{activityid}/bookings`. Slot information will be passed by client end.
  * Update a booking.
    * _A consumer cannot update a booking, and has to cancel and re-book the activity._
  * Cancel a booking
    * `DELETE /bookings/{bookingid}`
* My bookmarked activities (favorites), which are the activities that I am interested and keep an eye on. Potentially I will book in near future
  * Get all my favorites
    * `GET /favorites`
  * Create a favorite
    * `POST /favorites`
  * Delete a favorite
    * `DELETE /favorites/{favoriteid}`
* Searches
  * Get all historical search settings
    * `GET /searchHistory`
  * Create a search setting
    * `POST /searchHistory`
  * Delete a search setting
    * `DELETE /searchHistory/{searchHistoryId}`
* Feedbacks/comments
  * Get all my feedbacks
    * `GET /feedbacks`
  * Create a feedback. Has to be the booker of the activity
    * `POST /activities/{activityId}/feedbacks`
  * Update a feedback
    * `PUT /feedbacks/{feedbackid}`
  * Delete a feedback
    * `DELETE /feedbacks/{feedbackid}`
