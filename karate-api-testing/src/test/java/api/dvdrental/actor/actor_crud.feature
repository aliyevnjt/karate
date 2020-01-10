Feature: Create -> Retrieve -> Modify -> Delete
  I want to use this feature to do CRUD in actors table

  Background: 
    * configure report = { showLog: true, showAllSteps: false }
    * def jsonRequest = read('classpath:api/dvdrental/jsonFiles/actor.json')

  @actor
  Scenario: CRUD
    Given url baseUrl + '/actor'
    Then method get
    * def actorJson = response[0]
    * remove actorJson.actor_id
    * remove actorJson.last_update
    * set actorJson.first_name = 'Simba'
    * set actorJson.last_name = 'Ursula'
    Then header Content-Type = 'application/json'
    And request actorJson
    Then method post
    And status 201
    #Retrieve actor to verify that actor was created
    Given url baseUrl + '/actor?first_name=eq.Simba'
    Then method get
    And status 200
    And match response[0].first_name == 'Simba'
    And match response[0].last_name == 'Ursula'
    # Modify actor
    * def actorJson = response
    Given url baseUrl + '/actor?actor_id=eq.' + actorJson[0].actor_id
    * set actorJson[0].first_name = 'Winny'
    And request actorJson
    Then method put
    And status 204
    # Retrieve actor to verify modify step
    Given url baseUrl + '/actor?first_name=eq.Winny'
    Then method get
    And status 200
    And match response[0].first_name == 'Winny'
    And match response[0].last_name == 'Ursula' 
    # Delete Actor
    * def id = response[0].actor_id
    Given url baseUrl + '/actor?actor_id=eq.' + id
    Then method delete
    And status 204
    
    * print actorJson
    
    
    # TASK: SAME SCENARION IN FILM TABLE
    
    
    
    
    
