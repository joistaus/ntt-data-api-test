Feature: Pet API operations

  Background:
    * url baseUrl
    * configure headers = commonHeaders

  Scenario: Add a new pet to the store
    * def setup = karate.callSingle('classpath:petstore/pet/pet-setup.feature')
    Then match setup.petId == '#number'
    And match setup.petBody.name == 'Togo'
    And match setup.petBody.status == 'available'

  Scenario: Get pet by ID
    * def setup   = karate.callSingle('classpath:petstore/pet/pet-setup.feature')
    * def petId   = setup.petId
    * def petBody = setup.petBody
    Given path '/pet/' + petId
    When method GET
    Then status 200
    And match response.id     == petId
    And match response.name   == petBody.name
    And match response.status == petBody.status

  Scenario: Update pet name and status
    * def setup      = karate.callSingle('classpath:petstore/pet/pet-setup.feature')
    * def updateBody = read('data/update-pet.json')
    * set updateBody.id = setup.petId
    Given path '/pet'
    And request updateBody
    When method PUT
    Then status 200
    And match response.id     == setup.petId
    And match response.name   == updateBody.name
    And match response.status == updateBody.status
