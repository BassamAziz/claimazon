# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


the solution provided is an api to list products or show a single product in a json format
the api is ready to be consumed by any client
the database model consists of the following models/tables:

1. product
2. review - belongs to a product
3. tag
4. prodcut_tag - a join table between products and tags
5. recommendation - belongs to a product

Due to the amounnt of nested data that need to be fetched from across multiple tables in a single endpoint call,
it was decided to use a GraphQL API, as it also helps avoiding the N+1 problem that would be presented in case of using REST.
Another reason is the given fact that the API is likely to change in the near future and it would be desirable to minimize the changes needed as a consequence on the frontend/consuming clients.

The framework used for building the API is Rails.
Database: Postgresql


TODO:
  - Tests to be added:
    1. unit tests for the models
    2. integration tests for the controllers

  - Add Validations and associations to the models
  - implement pagination
  - have defaults for null values (eg: message => empty string default) in order to avoid handling null values on the frontend
  - solve n+1 problem
  - add show action