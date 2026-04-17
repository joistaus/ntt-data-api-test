Feature: Pet API operations

  Background:
    * url baseUrl
    * configure headers = commonHeaders

  Scenario: Add a new pet to the store
    * def expectedBody = read('data/add-pet.json')
    * def setup = call read('classpath:petstore/pet/pet-setup.feature')
    Then match setup.petId == '#number'
    And match setup.requestBody == expectedBody
    And match setup.responseBody.name == expectedBody.name
    And match setup.responseBody.status == expectedBody.status
    And match setup.responseBody.category == expectedBody.category
    And match setup.responseBody.tags == expectedBody.tags
    And match setup.responseBody.photoUrls == expectedBody.photoUrls

  Scenario: Get pet by ID
    * def setup = call read('classpath:petstore/pet/pet-setup.feature')
    * def petId = setup.petId
    * def expectedBody = setup.requestBody
    Given path '/pet/' + petId
    When method GET
    Then status 200
    And match response.id == petId
    And match response.name == expectedBody.name
    And match response.status == expectedBody.status
    And match response.category == expectedBody.category
    And match response.tags == expectedBody.tags
    And match response.photoUrls == expectedBody.photoUrls

  Scenario: Update pet name and status
    * def setup = call read('classpath:petstore/pet/pet-setup.feature')
    * def updateBody = read('data/update-pet.json')
    * set updateBody.id = setup.petId
    Given path '/pet'
    And request updateBody
    When method PUT
    Then status 200
    And match response.id == setup.petId
    And match response.name == updateBody.name
    And match response.status == updateBody.status
    And match response.category == updateBody.category
    And match response.tags == updateBody.tags
    And match response.photoUrls == updateBody.photoUrls

  Scenario: Search pet by status sold
    * def setup = call read('classpath:petstore/pet/pet-update-setup.feature')
    Given path '/pet/findByStatus'
    And param status = setup.updateBody.status
    When method GET
    Then status 200
    And match response == '#[] #present'
    And match each response contains { status: '#(setup.updateBody.status)' }
    And match response[*].id contains setup.petId
