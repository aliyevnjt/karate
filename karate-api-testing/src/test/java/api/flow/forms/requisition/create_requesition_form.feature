Feature: Create Requisition Form
	Background:
	
	* callonce read('classpath:api/flow/utils.feature')
	* def jsonCreate = read('classpath:api/flow/jsonFiles/create_requsition.json')
	
	Scenario: Create Requisition Form
   Given url baseUrl
   Then header Content-Type = 'application/json'
   * set jsonCreate.token = token
   * set jsonCreate.payload.title = 'Text Book'
   * set jsonCreate.payload.description = 'Math Text Book'
   #id for school A
   * set jsonCreate.payload.form_guid = schoolA
   #id for math department
   * set jsonCreate.payload.department_guid = 'dpt-5cda8502-827d-467b-aea0-fd6e6bb1222a'
   And request jsonCreate
   And method post
   And status 200
   And match response.description == 'Record´s created successfully.'
   And match response.payload.form_guid == schoolA
	   
  