@ignore
Feature: Pet setup

  Scenario: Create test pet
    * def petBody = read('classpath:petstore/pet/data/add-pet.json')
    Given url baseUrl
    And configure headers = commonHeaders
    And path '/pet'
    And request petBody
    When method POST
    Then status 200
    * def petId = response.id
