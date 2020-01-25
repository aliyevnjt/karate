Feature: Create films (Multiple films in one transaaction)

  Background: 
    * call read('classpath:api/dvdrental/utils.feature')
    * def jsonFilm = read('classpath:api/dvdrental/jsonFiles/film.json')

  @film13
  Scenario Outline: Create films
    Given url baseUrl + '/film'
    Then header Content-Type = 'application/json'
    * remove jsonFilm[0].film_id
    * set jsonFilm[0].title = '<title>'
    * set jsonFilm[0].description = '<description>'
    * set jsonFilm[0].rental_rate = <rental_rate>
    * set jsonFilm[1].title = '<title1>'
    * set jsonFilm[1].description = '<description1>'
    * set jsonFilm[1].rental_rate = <rental_rate1>
    * set jsonFilm[1].special_features[0] = 'Action'
    * set jsonFilm[1].special_features[1] = 'Trailer'
    * set jsonFilm[1].language_id = 1
    * set jsonFilm[1].rental_duration = 7
    * set jsonFilm[1].release_year = 2019
    * set jsonFilm[1].length = 90
    * set jsonFilm[1].replacement_cost = 18.59
    * set jsonFilm[1].rating = 'PG-13'
    * set jsonFilm[1].last_update = currDate()
    * set jsonFilm[1].fulltext = ""
    * print jsonFilm
    And request jsonFilm
    Then method post
    And status 201
    #Query db to get film. Replace with get api call after BIT-15 is implemented
    * def filmFromDB1 = db.readRows("select * from film where title = '<title>'")
    * print filmFromDB1
    And match filmFromDB1[0].title == '<title>'
    And match filmFromDB1[0].description == '<description>'
    And match filmFromDB1[0].rental_rate == <rental_rate>
    And def delete = db.delete("delete from film where title = '<title>'")
    * def filmFromDB2 = db.readRows("select * from film where title = '<title1>'")
    * print filmFromDB2
    And match filmFromDB2[0].title == '<title1>'
    And match filmFromDB2[0].description == '<description1>'
    And match filmFromDB2[0].rental_rate == <rental_rate1>
    And def delete = db.delete("delete from film where title = '<title1>'")

    Examples: 
      | title   | description                      | rental_rate | title1   | description1         | rental_rate1 |
      | Rembo 5 | Rembo brings peace to the world  |        9.99 | Rembo 11 | Rembo in mountains   |         5.99 |
      | Rembo 9 | Rembo brings peace to the world1 |       11.99 | Rembo 12 | Rembo in mountains 2 |         6.99 |
