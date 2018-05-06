# HTTP requests
## Protocol
All requests must be `HTTPS`.

## Headers 
All requests can have the `Accept-Language` to indicate locale.
```
Accept-Language: en-US,zh-CHS
```

`/sys/*` shouldn't have `Authentication` header.
`/api/1.0/*` should have `Authentication` header.



# HTTP responses
## Responses of 4XX, 5XX
Sample
```Javascript
// If it's an error
{
  error: string // Translated error message that can be shown on page.
  errorDetail: string // English tech information for debugging purposes.
}
```

## Responses of 2XX 
```javascript
{
  message?: string // Optional. Translated message that can be shown on page.
  items: [] // If it's an array. It it's a single resource, its length will be 1. Zero element is possible.
  extra?: {} // Any additional objects if necessary
}
```

## Responses of 1XX, 3XX
They should have no response body. 

## Images
At this time, all images will be updated in base64 and saved in the database.

# API paths
The root API path is `/api/1.0/*`. As of now two servers' API are
## Swagger
* [https://virtserver.swaggerhub.com/airmnb/api/1.0/](https://virtserver.swaggerhub.com/airmnb/api/1.0/)

## Prod
The platform has to be hosted on two environments to handle the traffic from China and non-China. But both are sharing the same database, which is supposed to be hosted in AWS Sydney region.

For out of China,
* Domain name [https://www.airmombaby.com/api/1.0/](https://www.airmombaby.com/api/1.0/).
* Hosted on AWS Sydney region.
* Use Google as the map service API provider.

Within China
* Domain name [https://www.airmnb.com/api/1.0/](https://www.airmnb.com/api/1.0/) 
* Hosted on Tencent Cloud.
* User Gaode as the map service API provider.
* WeApp has to call this domain, no matter if it's within China or not.


## API sub path
All `xxxId`s mentioned in this documentation are preferred of UUID format.

### System level

* Login
  * Airmnb native user login
    * `GET /sys/login`
  * WeApp (Weixin mini-program)
    * `GET /sys/login/weapp?code={openid}`
  * Google/Facebook SSO
    * `GET /sys/login?use=google`
    * `GET /sys/login?use=facebook`
    * `GET /sys/login?use=wechat`
    * `GET /sys/authentication_response`
* Native user sign up
  * `POST /sys/signup`
  ```javascript
  // Request
  {
    "accountName": "",
    "password": "",
    "from"? : "web"
  }
  
  // Response. The same response as /sys/whoami
  {
    "sessionId": "",
    "sessionToken": "",
    "user": {}
  }
  ```
* User management
  * Get user
    * `GET /api/1.0/users/{userId}`
  * Create a new user or register a local user
    * `POST /api/1.0/users`
  * Update user data
    * `PUT /api/1.0/users/{userId}`
* Logout
  * `POST /sys/logout`
* Health check
  * `GET /sys/health-check`
* About us information
  * `GET /sys/about/us`
* Statistic information
  * `GET /sys/about/stat`
* Get the platform version information
  * `GET /sys/about/version`
* User behavior tracking [optional]
  * `POST /sys/trackings`

### For Providers
All are under `/api/1.0/`.
* Provider information/profile
  * Get provider
    * `GET /providers/{providerId}`
  * Create new provider profile (promote a user to provider)
    * `POST /providers`
  * Update provider
    * `PUT /providers/{providerId}`
* Activity by a provider
  * Get all activities by a provider
    * `GET /providers/{providerId}/activities?conditions=...`
  * Get single activity
    * `GET /activities/{activityId}`
  * Create an activity
    * `POST /providers/{providerId}/activities`. Will create slots automatically.
  * Update an activity
    * `PUT /activities/{activityId}`
  * Delete an activity
    * `DELETE /activities/{activityId}` Just update status on an activity object. Syntax sugar for the `PUT`
* Slots of an activity
  * Get all slots by a activity
    * `GET /activities/{activityId}/slots?conditions=...`
  * Update a slot. Change time
    * `PUT /slots/{slotId}`
  * Delete a slot
    * `DELETE /slots/{slotId}`
* Venue of an activity
  * Get all venues by a provider
    * `GET /providers/{providerId}/venues?conditions=...`
  * Get all venues
    * `GET /venues`
  * Get single venue
    * `GET /venues/{venueId}`
  * Create a venue
    * `POST /venues`
  * Update a venue
    * `PUT /venues/{venueId}`
  * Delete a venue
    * `DELETE /venues/{venueId}`
* Booking management by provider
  * Get all bookings by a provider
    * `GET /providers/{providerId}/bookings?conditions=...`
    * `GET /providers/{providerId}/bookings/ongoing` (shorthand)
    * `GET /providers/{providerId}/bookings/closed` (shorthand)
    * `GET /providers/{providerId}/bookings` (shorthand of `/ongoing`)
  * Get all bookings under an activity
    * `GET /activities/{activityId}/bookings?conditions=...`
  * Get a booking
    * `GET /bookings/{bookingId}`
  * Update a booking, like change price to specific consumer
    * `PUT /bookings/{bookingId}`
  * Terminate a booking (refused to provide service to the consumer of the booking)
    * `DELETE /bookings/{bookingId}`
* View feedback/comments. Provider cannot create feedback nor comment on consumers' feedback
  * Get all feedbacks for this provider's activities
    * `GET /providers/{providerId}/feedbacks?conditions=...`
  * Get all feedbacks for specific activity
    * `GET /activities/{activityId}/feedbacks`


### For Consumers
All are under `/api/1.0/`.
* Babies of the consumer
  * Get all babies
    * `GET /users/{userId}/babies?conditions=...`
  * Get single baby
    * `GET /babies/{babyId}`
  * Create a baby
    * `POST /babies`
  * Update a baby
    * `PUT /babies/{babyId}`
  * Delete a baby
    * `DELETE /babies/{babyId}`
* Bookings
  * Get all my bookings
    * `GET /bookings?conditions=...`
    * `GET /bookings/ongoing` (shorthand)
    * `GET /bookings/closed` (shorthand)
    * `GET /bookings` (shorthand of `ongoing`)
  * Get single booking
    * `GET /bookings/{bookingId}`
  * Create a bookings of an activity. (Create a booking based on an activity)
    * `POST /activities/{activityId}/bookings`. Slot information will be passed by client end.
  * Update a booking.
    * _A consumer cannot update a booking, and has to cancel and re-book the activity._
  * Cancel a booking
    * `DELETE /bookings/{bookingId}`
* My bookmarked activities (favorites), which are the activities that I am interested and keep an eye on. Potentially I will book in near future
  * Get all my favorites
    * `GET /favorites`
  * Create a favorite
    * `POST /favorites`
  * Delete a favorite
    * `DELETE /favorites/{favoriteId}`
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
    * `PUT /feedbacks/{feedbackId}`
  * Delete a feedback
    * `DELETE /feedbacks/{feedbackId}`
