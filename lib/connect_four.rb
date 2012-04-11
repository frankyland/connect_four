require 'gamefield'
require 'player'
require 'logic'


module ConnectFour
 	start = Gamefield.new
	field = start.create_gamefield_array
	start.print_game_field(STDOUT, STDIN)		
	
end
