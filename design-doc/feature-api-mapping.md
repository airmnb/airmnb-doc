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
    * `GET /providers/{prodiderid}/activities/{activityid}`
    * `GET /activities/{activityid}` Used for deep linking
  * Create an activity
    * `POST /providers/{prodiderid}/activities`
  * Update an activity
    * `PUT /providers/{prodiderid}/activities/{activityid}`
  * Delete an activity
    * `DELETE /providers/{prodiderid}/activities/{activityid}` Just update status on an activity object. Syntax sugar for the `PUT`
* Venue/location of an activity
  * Get all venues by a provider
    * `GET /providers/{providerid}/venues?conditions=...`
  * Get single venue
    * `GET /providers/{prodiderid}/venues/{venueid}`
  * Create a venue
    * `POST /providers/{prodiderid}/venues`
  * Update a venue
    * `PUT /providers/{prodiderid}/venues/{venueid}`
  * Delete a venue
    * `DELETE /providers/{prodiderid}/venues/{venueid}`
* Booking management by provider
  * Get all bookings by a provider
    * `GET /providers/{providerid}/bookings?conditions=...`
    * `GET /providers/{providerid}/bookings/ongoing` (shorthand)
    * `GET /providers/{providerid}/bookings/closed` (shorthand)
    * `GET /providers/{providerid}/bookings` (shorthand of `/ongoing`)
  * Get all bookings under an activity
    * `GET /providers/{providerid}/activities/{activityid}/bookings?conditions=...`
  * Get a booking
    * `GET /providers/{providerid}/bookings/{bookingid}`
  * Update a booking, like change price to specific consumer
    * `PUT /providers/{providerid}/bookings/{bookingid}`
  * Terminate a booking (refused to provide service to the consumer of the booking)
    * `DELETE /providers/{providerid}/bookings/{bookingid}`
* View feedback/comments. Provider cannot create feedback nor comment on consumers' feedback
  * Get all feedbacks for this provider's activities
    * `GET /providers/{providerid}/feedbacks?conditions=...`
  * Get all feedbacks for specific activity
    * `GET /providers/{providerid}/activities/{activityid}/feedbacks`


# For Consumers
* Babies of the consumer
  * Get all babies
    * `GET /users/{userid}/babies?conditions=...`
  * Get single baby
    * `GET /users/{userid}/babies/{babyid}`
  * Create a baby
    * `POST /users/{userid}/babies`
  * Update a baby
    * `PUT /users/{userid}/babies/{babyid}`
  * Delete a baby
    * `DELETE /users/{userid}/babies/{babyid}`
* Bookings
  * Get all my bookings
    * `GET /users/{userid}/bookings?conditions=...`
    * `GET /users/{userid}/bookings/ongoing` (shorthand)
    * `GET /users/{userid}/bookings/closed` (shorthand)
    * `GET /users/{userid}/bookings` (shorthand of `ongoing`)
  * Get single booking
    * `GET /users/{userid}/bookings/{bookingid}`
  * Create a booking. (Create a booking based on an activity)
    * `POST /providers/{prodiderid}/activities/{activityid}`
  * Update a booking.
    * _A consumer cannot update a booking, and has to cancel and re-book the activity._
  * Cancel a booking
    * `DELETE /users/{userid}/bookings/{bookingid}`
* My bookmarked activities (favorites), which are the activities that I am interested and keep an eye on. Potentially I will book in near future
  * Get all my favorites
    * `GET /users/{userid}/favorites`
  * Create a favorite
    * `POST /users/{userid}/favorites`
  * Delete a favorite
    * `POST /users/{userid}/favorites/{favoriteid}`
* Searches
  * Get all historical search settings
    * `GET /users/{userid}/filters`
  * Create a search setting
    * `POST /users/{userid}/filters`
  * Delete a search setting
    * `DELETE /users/{userid}/filters/{filterid}`
* Feedbacks/comments
  * Get all my feedbacks
    * `GET /users/{userid}/feedbacks`
  * Create a feedback. Has to be the booker of the activity
    * `POST /users/{userid}/bookings/{bookingid}/feedbacks`
  * Update a feedback
    * `PUT /users/{userid}/bookings/{bookingid}/feedbacks/{feedbackid}`
  * Delete a feedback
    * _Cannot delete a feedback once created_
