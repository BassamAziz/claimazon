# README

About

The solution provided is an API to list all products or show a single product in a json format
the api is ready to be consumed by any client

 ### Problem Analysis:
 
    Due to the amount of nested data that need to be fetched from across multiple tables in a single endpoint call,
    it was decided to use a GraphQL API, as it helps avoiding the N+1 problem that would be presented in case of using REST.
    In addition, and based on the given fact that the API is likely to change in the near future, GraphQL provides the flexibility to alter underlaying layers of       the API without affecting the response provided by the endpoint and it's up to the client to define the exact data and format desired.

 ### Database Model:

    1. product
    2. review - belongs to a product
    3. tag
    4. prodcut_tag - a join table between products and tags
    5. recommendation - belongs to a product



### Yet TO DO:
  - Tests to be added:
    1. unit tests for the models
    2. integration tests for the endpoints

  - Add Validations to the models in order to have a level of security and consistency of the data.
  - implement pagination - necessary for scalability in terms of the amount of products and reviews stored.
  - have database-level defaults for null values (eg: message => empty string default) in order to avoid explicitly handling null values on the frontend

### Getting started

* Ruby version
  2.5.1
  
* System dependencies
  - rails
  - postgresql
  
  run `bundle install`

* Database creation
  default database configuration can be found in database.yml
  
  `url: postgres://postgres:@localhost:5432`
  
  configure your database accordingly or feel free to change the url above

* Database initialization
  run `rails db:reset`

* How to run the test suite
  - run `rspec`


