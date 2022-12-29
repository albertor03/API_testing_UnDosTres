Feature: List Users

    Background:
        * url baseUrl
        * def baseRequest = {name: '#(name)', job: '#(job)'}
        * def baseResponse = {name: '#(name)', job: '#(job)', id: "#string", createdAt: "#string"}

    Scenario: Create an user
        Given path 'api/users'
        And request baseRequest
        When method post
        Then status 201
        And match response == baseResponse