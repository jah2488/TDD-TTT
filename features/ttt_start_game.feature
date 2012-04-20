Feature: TTT starting the game

  Background:
    Given I am not yet playing
    When I start the game

  Scenario: Start Game
    Then I should see "Tic Tac Toe"
    And I should see "How many players are there? (1) or (2)"

  Scenario: Choosing Amount of Players
    When I input "1"
    Then I should see "Would you like to be player (X) or player (O)?"

  Scenario: Picking My Player
    When I pick player X
    Then I should see "Its Xs Turn"

  Scenario: Picking Player Y
    When I pick player Y
    Then I should see "Its Xs Turn"
