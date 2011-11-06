Feature: Demo
  Make sure Cucumber and Directory/File listing is working fine

  Scenario: List a movie
    When I choose the movie directory "Movies"
    Then there should be a listing for "foobar.avi"

