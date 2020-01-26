Feature: Delete Requisition Form
	Background:
	
	* callonce read('classpath:api/flow/utils.feature')
	* def jsonDelete = read('classpath:api/flow/jsonFiles/delete_req.json')
	
	Scenario: Delete Requisition Form
   Given url baseUrl
   Then header Content-Type = 'application/json'
   * set jsonDelete.token = token
   * set jsonDelete.payload.guid = 'rqs-fbcfb301-8b9b-4c1c-bceb-a1018239a819'
   Then request jsonDelete
   And method post
   And status 200
	   
  