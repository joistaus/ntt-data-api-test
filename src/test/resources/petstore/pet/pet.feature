Feature: Pet API operations

  Background:
    * url baseUrl
    * configure headers = commonHeaders

  Scenario: Add a new pet to the store
    * def petBody = read('data/add-pet.json')
    Given path '/pet'
    And request petBody
    When method POST
    Then status 200
    And match response.name == 'Togo'
    And match response.status == 'available'
    And match response.id == '#number'
    * karate.set('petId', response.id)
