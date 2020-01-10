Feature: Read different feature file
	
	Background: 
	* call read('classpath:api/dvdrental/utils.feature')
  
  Scenario: Read different feature file
  * def date = currDate()
  * print date
  
  * print pastDate(1)

	* def date = db.readRows('select last_update from actor order by last_update asc limit 1;')
	And assert date[0].last_update <= pastDate(60)
	
	* print date[0].last_update + " vs " +  pastDate(60)
