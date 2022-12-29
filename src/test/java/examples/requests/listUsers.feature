Feature: List Users

  Background:
    * url baseUrl
    * path 'api'
    * def userDataResponse = { "id": "#number", "email": "#string", "first_name": "#string", "last_name": "#string", "avatar": "#string"}\
    * def unknownDataResponse = { "id": "#number", "name": "#string", "year": "#number", "color": "#string", "pantone_value": "#string"}
    * def baseResponse = 
    """
      {
        "page": "#(total_pages)",
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

  @list_users
  Scenario: get all users
    Given path 'users'
    And param page = total_pages
    When method get
    Then status 200
    And match response == baseResponse
    And match each response.data == userDataResponse

  @list_resources
  Scenario: get all unknown
    Given path 'unknown'
    When method get
    Then status 200
    * baseResponse.page = "#number"
    * baseResponse.data = "#[] unknownDataResponse"
    And match response == baseResponse
    And match each response.data == unknownDataResponse

  @unhappy_path_list
  Scenario Outline: Unhappy path to get all <pathTo>
    Given path <pathTo>
    And param page = 40
    When method get
    Then status 200
    * baseResponse.page = 40
    * baseResponse.data = "#[]"
    And match response == baseResponse

    Examples:
    |pathTo   |
    |'users'  |
    |'unknown'|