Feature: Register User

    Background:
        * url baseUrl
        * def baseRequest = {"email": "eve.holt@reqres.in", "password": "pistol"}
        * def baseResponse = {"id": "#number", "token": "#string"}

    @register_successful
    Scenario: REGISTER - SUCCESSFUL
        Given path 'api/register'
        And request baseRequest
        When method post
        Then status 200
        And match response == baseResponse
    
    @register_unsuccessful
    Scenario Outline: REGISTER - UNSUCCESSFUL (<action>)
        Given path 'api/register'
        And request <Resquest>
        When method post
        Then status 400
        And match response == <Response>

        Examples:
        |action|Resquest| Response|
        |"Without Password"|{"email": "eve.holt@reqres.in"}|{"error": "Missing password"}|
        |"Without Email or username"|{"password": "pistol"}|{"error": "Missing email or username"}|
        |"With Email or username diferente"|{"email": "karate@framework", "password": "pistol"}|{"error": "Note: Only defined users succeed registration"}|
