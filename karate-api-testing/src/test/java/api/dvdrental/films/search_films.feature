Feature: Search films

  Background: 
    * call read('classpath:api/dvdrental/utils.feature')
    * def jsonFilm = read('classpath:api/dvdrental/jsonFiles/film.json')

  Scenario Outline: Search films
    Given url baseUrl + '/film'
    And param <search_criteria>
    Then method get
    And status 200
    And <validation>

    Examples: 
      | search_criteria                                                                                                     | validation                                |
      | film_id = 'eq.874'                                                                                                  | match response[0].title == 'Tadpole Park' |
      | title = 'eq.Tadpole Park'                                                                                           | match response[0].film_id == 874          |
      | description = 'eq.A Beautiful Tale of a Frisbee And a Moose who must Vanquish a Dog in An Abandoned Amusement Park' | match response[0].film_id == 874          |
      | release_year = 'eq.2006'                                                                                            | match response.size() == 1000             |
      | language_id = 'eq.1'                                                                                                | match response.size() == 1002             |
      | rental_duration = 'eq.7'                                                                                            | match response.size() == 193              |
      | rental_rate = 'eq.4.99'                                                                                             | match response.size() == 338              |
      | length = 'eq.86'                                                                                                    | match response.size() == 6                |
      | replacement_cost = 'eq.14.99'                                                                                       | match response.size() == 53               |
      | rating = 'eq.PG-13'                                                                                                 | match response.size() == 223              |
