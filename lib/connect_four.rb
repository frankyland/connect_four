require 'player'
require 'logic'
require 'gamefield'


#
#
#
module ConnectFour
  #Create Objects from the classes
 	start = GameField.new
	game = Logic.new
	player = Player.new
	
	#Ask for individual Player names
	game.set_player(STDIN)
	#Create the 2 Dimensional Array for the Game field
	start.create_gamefield_array
	#Print the Game field into the Terminal console
	start.print_game_field
	#Starts the Game against an other Player
	game.two_player_game(STDIN)
end
