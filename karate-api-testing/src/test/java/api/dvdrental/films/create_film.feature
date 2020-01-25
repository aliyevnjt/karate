Feature: Create film

  Background: 
    * call read('classpath:api/dvdrental/utils.feature')
    * def jsonFilm = read('classpath:api/dvdrental/jsonFiles/film.json')

  @film12
  Scenario Outline: Create film
    Given url baseUrl + '/film'
    Then header Content-Type = 'application/json'
    * remove jsonFilm[0].film_id
    * set jsonFilm[0].title = '<title>'
    * set jsonFilm[0].description = '<description>'
    * set jsonFilm[0].rental_rate = <rental_rate>
    And request jsonFilm
    Then method post
    And status 201
    #Query db to get film. Replace with get api call after BIT-15 is implemented
    * def filmFromDB = db.readRows("select * from film where title = '<title>'")
    * print filmFromDB
    And match filmFromDB[0].title == '<title>'
    And match filmFromDB[0].description == '<description>'
    And match filmFromDB[0].rental_rate == <rental_rate>
    And def delete = db.delete("delete from film where title = '<title>'")

    Examples: 
      | title   | description                              | rental_rate |
      | Rembo 5 | Rembo brings peace to the world          |        9.99 |
      | Rembo 6 | Rembo brings peace to the Middle East    |       19.99 |
      | Rembo 8 | Rembo brings peace to the Sout East Asia |        5.99 |
