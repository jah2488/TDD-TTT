require 'pry'
class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end

  def print(message)
    messages << message
  end

  def last
    @messages.last
  end
end

class Input
  def messages
    @messages ||= []
  end

  def gets
    ""
  end
end

def output
  @output ||= Output.new
end

def input
  @input ||= Input.new
end

## GIVEN

Given /^I am not yet playing$/ do
end

Given /^I am playing a multiplayer game as player "([^"]*)"$/ do |player_type|
  @current_game = TicTacToe::MultiPlayerGame.new(output, input)
end

## WHEN

When /^I start the game$/ do
  game = TicTacToe::Game.new(output, input)
  game.stub(:input).and_return('1')
  game.setup
end

When /^I pick player X$/ do
  game = TicTacToe::SinglePlayerGame.new(output, input)
end

When /^I input "([^"]*)"$/ do |game_type|
  case game_type.to_i
  when 1 then TicTacToe::SinglePlayerGame.new(output, input)
  when 2 then TicTacToe::MultiPlayerGame.new(output, input)
  else
    RaiseArguementError
  end
end

When /^I pick player Y$/ do
  game = TicTacToe::SinglePlayerGame.new(output, input)
end

When /^I make a move to space "([^"]*)" on the board$/ do |space|
  @current_game.move(space)
end

When /^I have moves on spaces "([^"]*)"$/ do |moves|
  moves.delete(' ').split(',').each do |space|
    @current_game.move(space)
    @current_game.end_turn
  end
end

When /^I ask for help$/ do
  @current_game.help
end


## THEN

Then /^I should see "([^"]*)"$/ do |message|
  @output.messages.should include(message)
end

Then /^the board should show my move on "([^"]*)"$/ do |space|
  @output.last.should include(@current_game.current_player)
  @current_game.end_turn
end

Then /^the board should show my moves on "([^"]*)"$/ do |spaces|
  @output.messages.should_not include(spaces)
end


