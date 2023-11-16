@establishment
Feature: Products and Establishments List 

Scenario: Successfully print typeOfEstablishment
Given the VRPAT is available
When I Send GET HTTP request
Then I receive valid HTTP response code 200
And response body contains typeOfEstablishment object
And a random typeOfEstablishment is printed
