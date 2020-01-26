Feature: Utils
	@utils
  Scenario: Utils
  * def schoolA = 'frm-b7cc14c8-4081-4ec0-b96c-042f53669474'
    * configure report = { showLog: true, showAllSteps: false }
    * def currDate =
    
      """
      function(days){
      	var LocalDate = Java.type('java.time.LocalDate');
      	var ld = LocalDate.now();
      	return ld.toString();
      }
      """
    * def pastDate =
      """
      function(days){
      	var LocalDate = Java.type('java.time.LocalDate');
      	var ld = LocalDate.now();
      	return ld.minusDays(days);
      }
      """
    # use jdbc to validate
    * def config = { username: 'postgres', password: 'boston', url: 'jdbc:postgresql://localhost:5433/dvdrental', driverClassName: 'org.h2.Driver' }
    * def DbUtils = Java.type('api.dbc.DbUtils')
    * def db = new DbUtils(config)
    # since the DbUtils returns a Java Map, it becomes normal JSON here !
    # which means that you can use the full power of Karate's 'match' syntax
    #
    
    #Login and capture token
    * def jsonLogin = read('classpath:api/flow/jsonFiles/login.json')
    Given url baseUrl
    * set jsonLogin.username = username
    * set jsonLogin.password = password
    # change from merve
		Then request jsonLogin
		Then header Content-Type = 'application/json'
		And method post
		* def token = response.payload.token
		#change from nijat
		
    
    
      
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
