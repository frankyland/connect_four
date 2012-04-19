require 'gamefield'
class Logic
  game_field = GameField.new
  
	# Define a Method that 2 player playing against each other connect four
  def two_player_game(on)
	   
  	counter=0
	  winner = false
	#  end_turn= !gamefield.n_field? or ( winner != nil)
	  player =game_field.player

	
	  print   "Please Enter X or O for the game"
	  insert =  on.gets.downcase.chomp
	  who = nil
	  who = (enter == 'x') ? 1 : 0

    while true
		  turn_right = false
		  until turn_right
		    if  game_field.empty_space(counter) == false
		      break
		    end
		  	print " It's #{player[who]} turn:" 
		  	number = on.gets.to_i
        if game_field.full_column == true
          print "column is full please insert in other column"
      
  			else
			    turn_right=  game_field.add_object(Logic.new(player[who], number))
			  end
			  counter +=1
		  end
		  
		  winner = game_over(player[who])
		  end_turn= !gamefield.empty_space or ( winner != nil)
		  break if (end_turn or !turn_right)
		  who +=1
		  who %2

    end 
	
	  if winner != nil
		  return  player[who]
	  else
		  return nil
	  end
  end

  # Going through every field if the game is over and with that a winner is set
	def game_over(player[who])
		i,j =0
		counter = 1
		win = false
		while i < 8 
			
			j =0
		  while j<8
			  win = game_field.walktrough(i,j)
			  if win == true
			    return player[who]
		    end    
				j+=1
			end
			
			i+=1
		end
		
	end
		
end
	
