# GeoLocation

* Ruby version 3.1.2
* Rails Version 7.1
* Database: PostgresSql@14

# Local Setup

  Makefile is added in the project

  * Backend Setup
  ```
    make be-setup
  ```

  * Start Rails server
  ```
    make be-server
  ```
  * Run Tests
  ```
    make be-test
  ```

  * Api Endpoint

```
   curl -X GET "localhost:3000/find_location?ip_address="<ip_address>""
```
example:
```
   curl -X GET "localhost:3000/find_location?ip_address="200.106.141.12""
```

> Note:
> Custom database configuration can be provided in the application in database.yml

   * Rake Task

Added a rake task for importing CSV data you can run the task by using
```
    rake import:geolocation
```
