@ignore
Feature: Pet update setup

  Scenario: Create and update test pet
    * def createResult = call read('classpath:petstore/pet/pet-setup.feature')
    * def updateBody = read('classpath:petstore/pet/data/update-pet.json')
    * set updateBody.id = createResult.petId
    Given url baseUrl
    And configure headers = commonHeaders
    And path '/pet'
    And request updateBody
    When method PUT
    Then status 200
    * def petId = createResult.petId
    * def responseBody = response
