Feature: E2E Requisition Form

  Background: 
    * callonce read('classpath:api/flow/utils.feature')
    * def jsonCreate = read('classpath:api/flow/jsonFiles/create2.json')
    * def jsonDelete = read('classpath:api/flow/jsonFiles/delete_req.json')

  Scenario: E2E Requisition Form
    Given url baseUrl
    Then header Content-Type = 'application/json'
    * set jsonCreate.token = token
    * set jsonCreate.payload.title = 'Math class 101'
    * set jsonCreate.payload.description = 'Math Text Book 101'
    #id for school A
    * set jsonCreate.payload.form_guid = schoolA
    #id for math department
    * set jsonCreate.payload.department_guid = dept_science
    And request jsonCreate
    And method post
    And status 200
    And match response.description == 'Record´s created successfully.'
    And match response.payload.form_guid == schoolA
    * def formId = response.payload.guid
    * set jsonDelete.token = token
    * set jsonDelete.payload.guid = formId
    # Send request
    * def jsonSend = read('classpath:api/flow/jsonFiles/send_request.json')
    * set jsonSend.payload.id = response.payload.id
    * set jsonSend.payload.guid = response.payload.guid
    * set jsonSend.payload.form_guid = response.payload.form_guid
    * set jsonSend.payload.department_guid = response.payload.department_guid
    * set jsonSend.payload.title = response.payload.title
    * set jsonSend.payload.description = response.payload.description
    * set jsonSend.token = token
    And request jsonSend
    Then method post
     #Dave Approve
    Given url baseUrl
    * set jsonLogin.username = 'dave'
    * set jsonLogin.password = 'dave'
		Then request jsonLogin
		Then header Content-Type = 'application/json'
		And method post
		* def token = response.payload.token
		* set jsonSend.token = token
		* set jsonSend.payload.next_to_action = dave_id
		* set jsonSend.payload.action_notes = "Dave is in action"
		And request jsonSend
		And method post
		
    
    
    
    
    
    
    
    
    