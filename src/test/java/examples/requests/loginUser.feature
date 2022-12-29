Feature: Login User

    Background:
        * url baseUrl
        * def baseRequest = { "email": "eve.holt@reqres.in", "password": "cityslicka" }
        * def baseResponse = {"token": "#string"}

    @login_successful
    Scenario: LOGIN SUCCESSFUL
        Given path 'api/login'
        And request baseRequest
        When method post
        Then status 200
        And match response == baseResponse

    @login_unsuccessful
    Scenario Outline: LOGIN UNSUCCESSFUL (<action>)
        Given path 'api/login'
        And request <Resquest>
        When method post
        Then status 400
        And match response == <Response>

        Examples:
        |action|Resquest| Response|
        |"Without Password"|{"email": "eve.holt@reqres.in"}|{"error": "Missing password"}|
        |"Without Email or username"|{"password": "pistol"}|{"error": "Missing email or username"}|
        |"With Email or username different"|{"email": "karate@framework", "password": "pistol"}|{"error": "user not found"}|
