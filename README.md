# airmnb-doc

# Features (Business Scenarios)

# Swagger

## Source code
See [`./swagger/README.md`](swagger/README.md) for how to develop the swagger code base.

## SwaggerHub Mock API
Mock API URL [https://virtserver.swaggerhub.com/airmnb/api/1.0.0/](https://virtserver.swaggerhub.com/airmnb/api/1.0.0/)

For example, if call the `/health-check` API like
```
curl -X GET https://virtserver.swaggerhub.com/airmnb/api/1.0.0/health-check
```
will return
```
"OK"
```

Another example by calling the `/stat` API
```
curl -X GET https://virtserver.swaggerhub.com/airmnb/api/1.0.0/stat
```
should return a JSON like
```
{
  "totalRegisteredUsers" : 0,
  "totalOnlineUsers" : 0,
  "totalProviders" : 0,
  "totalBabies" : 0,
  "totalActivities" : 0,
  "totalBookings" : 0,
  "totalTransactions" : 0
}
```
