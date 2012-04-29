require 'gamefield'
class Logic
  
  def initialize()
		@game_field = GameField.new
	  
	end
	
  # Define the 2 Player	
	def player 
		["X", "O"]
	end 
	
	
	
	# Define a Method that 2 player playing against each other connect four
  def two_player_game(input)
	   
  #	counter=0
	  winner = false
	#  end_turn= !gamefield.n_field? or ( winner != nil)
	 

	  who = 0
	 

    while true
		#  turn_right = false
		    
		  #  if  @game_field.empty_space(counter) == false
		   #   break
		   # end
		  	print " It's #{player[who]} turn:" 
		  	number = input.gets.to_i
		  	
		  	
        #if @game_field.full_column == true
         # print "column is full please insert in other column"
      
  			#else
  			 # To ensure that just numbers from 1 till 8 are allowed
  		   if number <9 and number >0 
			    @game_field.add_object(who, number)
			    #Change the player by set the variable "who" between 0 and 1
			    if who ==1
			      who =0
			    else
			      who+=1
			    end   
			   #Print the Game Field
			   @game_field.print_game_field
		    end
		    # Checked if there were a Winner by now
		    winner = game_over(who)
		    if winner !=nil
		    break
		  end  
    end 
	
	  if winner != nil
		  return  player[who]
	  else
		  return nil
	  end
  end

  # Going through every field if the game is over and with that a winner is set
	def game_over(who)
		win = false

		    #Starts a Method that returns true if there is a win in this game  
			  win = @game_field.walkthrough()
			  if win == true
			    return print "THE WINNER IS#{player[who]}"		    
      	end  	
  end		
end
