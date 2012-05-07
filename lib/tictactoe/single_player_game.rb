module TicTacToe
  class SinglePlayerGame < Game
   def initialize(output, input)
     super
     @output.puts "Would you like to be player (X) or player (O)?"
     @computer_type = get_computer_type
     @computer = ComputerPlayer.new(@computer_type)
   end
  end
end
