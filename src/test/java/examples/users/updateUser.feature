Feature: Update & Delete User

    Background:
        * url baseUrl
        * def baseRequest = call read('getUserInfo.js')
        * def baseResponse = {name: '#(baseRequest.name)', job: '#(baseRequest.job)', updatedAt: "#string"}


    Scenario Outline: <action> user
        Given path 'api/users/2'
        * def baseRequest = <status> == 204 ? '' : baseRequest
        And request baseRequest
        When method <method>
        Then status <status>
        And match response == <status> == 204 ? '': baseResponse

        Examples:
        | action    | method    | status   |
        | Update    | put       | 200      |
        | Patch     | patch     | 200      |
        | Delete    | delete    | 204      |
