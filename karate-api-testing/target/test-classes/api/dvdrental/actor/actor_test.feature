Feature: Get all actors
  I want to use this feature to get all actors

  Background: 
    * def jsonRequest = read('classpath:api/dvdrental/jsonFiles/actor.json')

  @tag1
  Scenario: Get all actors
    Given url baseUrl
    And path 'actor'
    Then method get
    Then print baseUrl

@tag2
  Scenario: Get all actors
    Given url baseUrl
    And path 'film'
    Then method get