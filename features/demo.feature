Feature: Demo
  Make sure Cucumber and Directory/File listing is working fine

  Scenario: List a movie
    When I choose the movie directory "test/Movies"
    Then there should be a listing for "foobar.avi"

  Scenario: Movie directory is empty
    When I choose an empty directory like "test/EmptyDirectory"
    Then there should be a message saying "Movie directory was empty"

