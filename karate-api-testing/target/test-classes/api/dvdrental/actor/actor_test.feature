Feature: Get all actors
  I want to use this feature to get all actors

  Background: 
    * configure report = { showLog: true, showAllSteps: false }
    * def jsonRequest = read('classpath:api/dvdrental/jsonFiles/actor.json')

  #@tag1
  Scenario: Get all actors
  Given url baseUrl + '/film'
  Then method get
  And status 200
  #And match response[0].first_name == 'Penelope'
  #And match response[0].actor_id == 1
  #Scenario: Create an actor
  #Given url baseUrl + '/actor'
  #Then header Content-Type = 'application/json'
  #* set jsonRequest[0].first_name = 'Pavi'
  #* set jsonRequest[0].last_name = 'Dsopathri'
  #And request jsonRequest
  #Then method post
  #And status 201
  #Scenario: Create an actor 1
  #Given url baseUrl + '/actor'
  #Then header Content-Type = 'application/json'
  #		* def actorJson = '{"first_name" : "Barak", "last_name" : "Obama"}'
  #		And request actorJson
  #Then method post
  #And status 201
  #Scenario: Create an actor 3
  #Given url baseUrl + '/actor'
  #Then header Content-Type = 'application/json'
  #* set jsonRequest[0].first_name = 'Pavi'
  #* set jsonRequest[0].last_name = 'Dsopathri'
  #* set jsonRequest[1].first_name = 'Barak'
  #* set jsonRequest[1].last_name = 'Obama'
  #* set jsonRequest[2].first_name = 'Pavi'
  #* set jsonRequest[2].last_name = 'Dsopathri'
  #* set jsonRequest[3].first_name = 'Barak'
  #* set jsonRequest[3].last_name = 'Obama'
  #* print jsonRequest
  #And request jsonRequest
  #Then method post
  #And status 201
  #Scenario: Create an actor 4
  #Given url baseUrl + '/actor'
  #Then header Content-Type = 'application/json'
  #* set jsonRequest[0].first_name = 'Pavi'
  #* set jsonRequest[0].last_name = 'Dsopathri'
  #* set jsonRequest[1].first_name = 'Barak'
  #* set jsonRequest[1].last_name = 'Obama'
  #* print jsonRequest
  #And request jsonRequest
  #Then method post
  #And status 201
  #Scenario Outline:
  #Given url baseUrl + '/actor?first_name=eq.<fn>'
  #Then method get
  #And response[0].first_name == '<fn>'
  #And response[0].last_name == '<ln>'
  #
  #Examples:
  #| fn    | ln        |
  #| Pavi  | Dsopathri |
  #| Barak | Obama     |
  #Scenario: Modify actor
  #Given url baseUrl + '/actor?actor_id=eq.278'
  #Then header Content-Type = 'application/json'
  #* set jsonRequest[0].first_name = 'Shavi'
  #And request jsonRequest
  #And method patch
  #Then status 204
  #Scenario: Modify actor 2
    #Given url baseUrl + '/actor?actor_id=eq.278'
    #Then header Content-Type = 'application/json'
    #* set jsonRequest[0].first_name = 'Thavi'
    #* remove jsonRequest[0].last_name
    #And request jsonRequest
    #And method patch
    #Then status 204
    
    #Scenario: Delete actor
    #Given url baseUrl + '/actor?actor_id=eq.278'
    #Then method delete
    #And status 204
