Feature: Search
  In order to find pages on the web
  As an information seeker
  I want to be able to search using keywords
  
  Scenario Outline: Search for cucumber
    Given I am on the home page
    And I have entered <text> into the "q" field
    When I click the "Search" button
    Then I should see <text>
  Examples:
	|  text |
	| cucumber bdd |
	|  Boston Red Sox |
	|  Giant Alligators |
        