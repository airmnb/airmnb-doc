# HTTP requests
## Protocol
All requests must be `HTTPS`.

## Headers 
All requests can have the `Accept-Language` to indicate locale.
```
Accept-Language: en-US,zh-CHS
```

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
* [https://www.airmombaby.com/api/1.0/](https://www.airmombaby.com/api/1.0/) for global traffic in Sydney region.
* [https://www.airmnb.com/api/1.0/](https://www.airmnb.com/api/1.0/) for China mainland in Tencent Cloud and all WeApp users.


## API sub path
All `xxxId`s mentioned in this documentation are preferred of UUID format.

### System level

* Login
  * Airmnb native user login
    * `GET /login`
  * WeApp (Weixin mini-program)
    * `GET /login?sso=weapp`
  * Google SSO
    * `GET /login?sso=google` 
    * `GET /logincallback?sso=google`
  * WeChat SSO [Optional]
    * `GET /login?sso=wechat` 
    * `GET /logincallback?sso=wechat`
  * Facebook SSO [Optional]
    * `GET /login?sso=facebook` 
    * `GET /logincallback?sso=facebook`
* User management
  * Get user
    * `GET /users/{userId}`
  * Create a new user or register a local user
    * `POST /users`
  * Update user data
    * `PUT /users/{userId}`
* Logout
  * `POST /logout`
* Health check
  * `GET /health-check`
* About us information
  * `GET /about/us`
* Statistic information
  * `GET /about/stat`
* Debuggin information, like version, commit hash, ...
  * `GET /about/debug`
  ```Javascript
  {
    version: {
      app: {
        releaseVersion:
        buildVersion:
        commitHash
      },
      web: {
        releaseVersion:
        buildVersion:
        commitHash
      },
      weapp: {
        releaseVersion:
        buildVersion:
        commitHash
      }
    },
    xxx?: {
    }
  }
  ```
* User behavior tracking [optional]
  * `POST /trackings`

### For Providers
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
