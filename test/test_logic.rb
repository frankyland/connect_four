require 'test_helper'
require 'test/unit'

class TestLogic < Test::Unit::TestCase

	def test_create_two_player
		test_logic = Logic.new
	  
	    name = test_logic.get_player()
	      assert_nil(name)
	    
	    
			
			
	end

end
