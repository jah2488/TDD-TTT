module TicTacToe
  class SinglePlayerGame < Game

   def initialize(output, input)
     super
     @output.puts "Would you like to be player (X) or player (O)?"
     @computer_type = get_computer_type
     @computer = ComputerPlayer.new(@computer_type)
   end

   def get_computer_type
     move = input.upcase
     until move == "X" || move  == "O"
       @output.puts "Invalid player type"
       move = input.upcase
     end
     return  move == 'X' ? 'O' : 'X'
   end

  end
end
