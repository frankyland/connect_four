require 'test_helper'

require 'test_gamefield'



class ConnectFourTest < ConnectFourSpec
  def test_logic_player_name
    logic = Logic.new
    name = logic.get_player()
    # Proofs if the array with the player names are not nil  
	  assert_not_nil(name)
  end
  
  def test_game_field
    game = GameField.new
    # Proofs if that the game field will be set
    assert(game.create_game_field_array, "Should be true") 
    # Proofs if the array with the player names are not nil
    assert(game.print_game_field, "Should be true")   
  end
  
  def test_empty_space
    game = GameField.new  
    # Proofs if the array with the player names are not nil
    assert(game.empty_space(64), "Should be true")
    
  end
  
    
end
