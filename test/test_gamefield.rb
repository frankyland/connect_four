require 'test_helper'
require 'test/unit'
require 'gamefield'

class TestGameField < Test::Unit::TestCase
a = [['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.']]
	def Test_create_gamefield
		test_field = GameField.new
		test_field.create_gamefield_array(a)
		test_field.print_game_field(a)

    
			assert_not_nil(test_field.walkthrough(1,1))			
	end

end
