Feature: Create Requisition Form

  Background: 
    * callonce read('classpath:api/flow/utils.feature')
    * def jsonCreate = read('classpath:api/flow/jsonFiles/create_requsition.json')
    * def jsonDelete = read('classpath:api/flow/jsonFiles/delete_req.json')

  Scenario Outline: Title Requisition Form Negative Scenario
    Given url baseUrl
    Then header Content-Type = 'application/json'
    * <action>
    * set jsonCreate.payload.title = <title>
    * set jsonCreate.payload.description = 'Math Text Book'
    #id for school A
    * set jsonCreate.payload.form_guid = schoolA
    #id for math department
    * set jsonCreate.payload.department_guid = 'dpt-5cda8502-827d-467b-aea0-fd6e6bb1222a'
    And request jsonCreate
    And method post
    And match response.description == <errorMessage>
    * print <desc>

    Examples: 
      | desc                      | title | errorMessage                   | action                            |
      | "Create with empty title" | ""    | "Missing properties: title"    | set jsonCreate.token = token      |
      | "wrong token"             | ""    | "An invalid token´s provided." | set jsonCreate.token = "skdjbgdk" |
