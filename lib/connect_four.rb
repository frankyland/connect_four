require 'player'
require 'logic'
require 'gamefield'



module ConnectFour
 	start = GameField.new
	game = Logic.new
	player = Player.new
	
	game.set_player(STDIN)
	start.create_gamefield_array
	start.print_game_field
	game.two_player_game(STDIN)
	
	


	


end
