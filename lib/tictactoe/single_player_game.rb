module TicTacToe
  class SinglePlayerGame < Game

   def initialize(output, input)
     super
     @output.puts "Would you like to be player (X) or player (O)?"
   end

   def start
     @output.puts "Its Xs Turn"
   end

  end
end
