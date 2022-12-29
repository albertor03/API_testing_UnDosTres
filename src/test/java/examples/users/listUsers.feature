Feature: List Users

  Background:
    * url baseUrl
    * path 'api'
    * def userDataResponse = { "id": "#number", "email": "#string", "first_name": "#string", "last_name": "#string", "avatar": "#string"}\
    * def unknownDataResponse = { "id": "#number", "name": "#string", "year": "#number", "color": "#string", "pantone_value": "#string"}
    * def baseResponse = 
    """
      {
        "page": 2,
        "per_page": "#number",
        "total": "#number",
        "total_pages": "#number",
        "data": "#[] userDataResponse",
        "support": {
          "url": "#string",
          "text": "#string"
        }
      }
    """

  Scenario: get all users
    Given path 'users'
    And param page = '2'
    When method get
    Then status 200
    And match response == baseResponse
    And match each response.data == userDataResponse  

  Scenario: get all unknown
    Given path 'unknown'
    When method get
    Then status 200
    * baseResponse.page = "#number"
    * baseResponse.data = "#[] unknownDataResponse"
    And match response == baseResponse
    And match each response.data == unknownDataResponse