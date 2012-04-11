require 'test_helper'
require 'test/unit'

class TestArrayColumn < Test::Unit::TestCase

	def Test_create_array_column
	   test_column = NewGameField.new
		test_column.CreateGameFieldArray
		test_column.ShowField
#			assert_send(array.new.array_column, "true")			
	end

end
