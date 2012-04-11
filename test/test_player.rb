require 'test_helper'
require 'test/unit'

class TestPlayer < Test::Unit::TestCase

	def Test_create_player
		player1 = Player.new(Mo)
		player2 = Player.new(Max)
		
		puts player1, player2
			
	end

end
