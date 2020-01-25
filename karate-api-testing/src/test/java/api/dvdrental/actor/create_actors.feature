Feature: Create multiple actors in one transaction

  Background: 
    * def actorJson = read('classpath:api/dvdrental/jsonFiles/actor.json')
    * call read('classpath:api/dvdrental/utils.feature')
    

  Scenario Outline: Create actors
    * remove actorJson[0].actor_id
    * remove actorJson[0].last_update
    * set actorJson[0].first_name = '<firstName>'
    * set actorJson[0].last_name = '<lastName>'
    
    * set actorJson[1].first_name = 'Tester1'
    * set actorJson[1].last_name = 'Test1'
    * print actorJson
    Given url baseUrl + '/actor'
    Then header Content-Type = 'application/json'
    And request actorJson
    And method post
    And status 201
    * def actor = db.readRows("select * from actor where first_name = '<firstName>'")
    * print actor
    
    And match actor[0].first_name == '<firstName>'
    And match actor[0].last_name == '<lastName>'
    
    * def actor = db.readRows("select * from actor where first_name = 'Tester1'")
    * print actor
    
    And match actor[0].first_name == 'Tester1'
    And match actor[0].last_name == 'Test1'
    
    * db.delete("delete from actor where first_name = '<firstName>'")
    * db.delete("delete from actor where first_name = 'Tester1'")
    
    Examples: 
      | firstName | lastName |
      | Tester    | Test     |
