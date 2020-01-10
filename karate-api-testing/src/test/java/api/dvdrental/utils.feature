Feature: Utils

  Scenario: Utils
    * configure report = { showLog: true, showAllSteps: false }
    * def currDate =
      """
      function(days){
      	var LocalDate = Java.type('java.time.LocalDate');
      	var ld = LocalDate.now();
      	return ld;
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
