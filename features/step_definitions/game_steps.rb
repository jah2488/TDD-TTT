require 'pry'
class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end

  def last
    @messages[@messages.length - 1]
  end
end

def output
  @output ||= Output.new
end

## GIVEN

Given /^I am not yet playing$/ do
end

Given /^I am playing a multiplayer game as player "([^"]*)"$/ do |player_type|
  @current_game = TicTacToe::MultiPlayerGame.new(output)
  @current_game.start(player_type)
end

## WHEN

When /^I start the game$/ do
  game = TicTacToe::Game.new(output)
  game.start
end

When /^I pick player X$/ do
  game = TicTacToe::SinglePlayerGame.new(output)
  game.start('X')
end

When /^I input "([^"]*)"$/ do |input|
  case input.to_i
  when 1 then TicTacToe::SinglePlayerGame.new(output)
  when 2 then TicTacToe::MultiPlayerGame.new(output)
  else
    RaiseArguementError
  end
end

When /^I pick player Y$/ do
  game = TicTacToe::SinglePlayerGame.new(output)
  game.start('Y')
end

When /^I make a move to space "([^"]*)" on the board$/ do |space|
  @current_game.move(space)
end

When /^I have moves on spaces "([^"]*)"$/ do |moves|
  moves.delete(' ').split(',').each do |space|
    @current_game.move(space)
  end
end

When /^I ask for help$/ do
    pending # express the regexp above with the code you wish you had
end


## THEN

Then /^I should see "([^"]*)"$/ do |message|
  @output.messages.should include(message)
end

Then /^the board should show my move on "([^"]*)"$/ do |space|
  @output.messages[1][space.to_i - 1].should include(@current_game.other_player)
end

Then /^the board should show my moves on "([^"]*)"$/ do |spaces|
  @output.messages.should_not include(spaces)
end

