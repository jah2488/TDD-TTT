Feature: Playing the game of TicTacToe

  Background:
    Given I am playing a multiplayer game as player "X"


  Scenario: Player can make a move
    When I make a move to space "a1" on the board
    Then the board should show my move on "1"
    And I should see "Its Os Turn"

  Scenario: Player can win the game
    When I have moves on spaces "a1, b1, a2, b2, a3"
    Then the board should show my moves on "a1, a2, a3"
    And I should see "Player X Wins!"
    And I should see "Game Over!"
    And I should see "Do you want to play again?"

  Scenario: When I ask for help, I am given a help response
    When I ask for help
    Then I should see "Pick a number coorisponding with an open tile on the board, then hit enter!"
    And I should see "For Example, typing 'a1' will place your move in the first cell (top left)"
