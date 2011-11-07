Feature: Demo
  In order :
  As a :
  I want :
  Make sure Cucumber and Directory/File listing is working fine

  Scenario: List a movie
    When I choose the movie directory "test/Movies"
    Then there should be a listing for "Rise.Of.The.Planet.Of.The.Apes.2011.720p.BRRip.XviD.AC3-ViSiON.avi"

  Scenario: Movie directory is empty
    When I choose the movie directory "test/EmptyDirectory"
    And the directory is empty
    Then there should be a message saying "Movie directory was empty"

  Scenario: Get IMDB info for movie release
    When I want to get IMDB info for the file "Rise.Of.The.Planet.Of.The.Apes.2011.720p.BRRip.XviD.AC3-ViSiON.avi"
    Then I should get a cleaned up movie file name of "Rise of the Planet of the Apes [2011].avi"

