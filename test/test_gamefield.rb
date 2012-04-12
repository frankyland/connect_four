require 'test_helper'
require 'test/unit'
require 'gamefield'

class TestGameField < Test::Unit::TestCase
a = [['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.'],['.','.','.','.','.','.','.','.']]
	def Test_create_gamefield
		test_field = GameField.new
		
		test_field.print_game_field(STDOUT, a)

			#assert_nil(CreateField.new)			
	end

end
