require 'gamefield'
require 'player'
class Logic
  
  def initialize()
		@game_field = GameField.new	 
	  @name = Array.new

	end
	
  # Define the 2 Player	
	def player(name) 
	  
	 @name.push(name)
	  	
	end 
	
	  def set_player(input) 
        print "Please enter your name : "
        @name[0] = input.gets
        print "Please enter your name : "
        @name[1] = input.gets
      
            
  end  
	
	
	# Define a Method that 2 player playing against each other connect four
  def two_player_game(input)
	   
  	game_counter= 0
  	draw = false
	  winner = false
	  who = 0
	 
    while true
   
		  # When at the End all fields are full and no winner was set , the game will end in a draw 
		  draw = @game_field.empty_space(game_counter) 
		  if draw == true
		    puts "It was a great Game, thats why this is a Draw. Try it next Time!"
        break
      end   
		  print " It's #{@name[who]} turn:" 
		#  print  player[who]
		  number = input.gets.to_i
		  
		  # Check if a column is full
		  # So the player isnt changing until the player set a column which isnt full
		  if @game_field.full_column(number) == false	
		    
  		  # To ensure that just numbers from 1 till 8 are allowed
  		  if number < 9 and number > 0 
			     
		      @game_field.add_object(who, number)
		      game_counter+= 1
		      # Change the player by set the variable "who" between 0 and 1
		      if who == 1
			      who = 0
			    else
			      who+= 1
			    end   
			    # Print the Game Field
			    @game_field.print_game_field
		    end
		    # Checked if there were a Winner by now
		    winner = game_over(who)
		    if winner != nil
		      break
		    end
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
