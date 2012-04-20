module TicTacToe
  class SinglePlayerGame < Game

   def initialize(output)
     super
     @output.puts "Would you like to be player (X) or player (O)?"
   end

   def start(player_type)
     @output.puts "Its Xs Turn"
   end

  end
end
