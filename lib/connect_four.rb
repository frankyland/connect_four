require 'gamefield'
require 'player'
require 'logic'



module ConnectFour
 	start = GameField.new
	field = start.create_gamefield_array(start.arrays(8,8))
	start.print_game_field(STDOUT, STDIN)		
	
end
