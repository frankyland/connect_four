require 'gamefield'
require 'player'
require 'logic'



module ConnectFour
 	start = GameField.new
	enter_game = Logic.new
	field = start.arrays(8,8)
	gamefield = start.create_gamefield_array(field)
	start.print_game_field(STDOUT)	
	enter_game.two_player_game(STDOUT, STDIN)	
	
end
