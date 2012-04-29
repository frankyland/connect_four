require 'player'
require 'logic'
require 'gamefield'



module ConnectFour
 	start = GameField.new
	game = Logic.new
	
	start.create_gamefield_array
	start.print_game_field
	game.two_player_game(STDIN)
	
	


	


end
