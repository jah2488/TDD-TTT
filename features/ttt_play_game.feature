Feature: Playing the game of TicTacToe

  Background:
    Given I am playing a multiplayer game as player "X"


  Scenario: Player can make a move
    When I make a move to space "1" on the board
    Then the board should show my move on "1"
    And I should see "Its Os Turn"

  Scenario: Player can win the game
    When I have moves on spaces "1, 4, 2, 5, 3"
    Then the board should show my moves on "1, 2, 3"
    And I should see "Player X Wins!"
    And I should see "Game Over!"
    And I should see "Do you want to play again?"

  Scenario: When I ask for help, I am given a help response
    When I ask for help
    Then I should see "Pick a number coorisponding with an open tile on the board, then hit enter!"
