require 'test_helper'
require 'test/unit'

class TestGameField < Test::Unit::TestCase

	def Test_create_gamefield
		test_field = GameField.new
		test_field.CreateGameField
		test_field.CreateGameFieldArray

			#assert_nil(CreateField.new)			
	end

end
