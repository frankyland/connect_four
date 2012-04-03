require 'test_helper'
require 'test/unit'

class TestArrayColumn < Test::Unit::TestCase

	def test_create_array_column
			assert_send(array.new.array_column, "true")			
	end

end
