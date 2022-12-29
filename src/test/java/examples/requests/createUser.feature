Feature: List Users

    Background:
        * url baseUrl
        * def baseRequest = call read(basePath + 'getUserInfo.js')
        * def baseResponse = {name: '#(baseRequest.name)', job: '#(baseRequest.job)', id: "#string", createdAt: "#string"}

    Scenario: Create an user
        Given path 'api/users'
        And request baseRequest
        When method post
        Then status 201
        And match response == baseResponse