require 'gamefield'
require 'player'
class Logic
  
  def initialize()
		@game_field = GameField.new	 
	  @name = Array.new

	end
	
  # Define the 2 Player	
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
		    puts "It was a great Game, but unfortunetley this is a Draw. Try it next Time!"
        break
      end   
		  print " It's #{@name[who]} turn:" 		
		  #Get the number vom the Terminal console
		  
		  number = input.gets.to_i
		  # Check if a column is full
		  # So the player isnt changing until the player set a column which isnt full
		  if @game_field.full_column(number) == false	
		    
  		  # To ensure that just numbers from 1 till 8 are allowed
  		  if number < 9 and number > 0 
			     
		      @game_field.add_object(who, number)
		      game_counter+= 1
		      # Change the player by set the variable "who" between 0 and 1
		      
			    # Print the Game Field
			    @game_field.print_game_field
		    end
		    # Checked if there were a Winner by now
		    win = @game_field.walkthrough()
			  if win == true
			    winner_blessing(who)
			    break
			  end
			  if who == 1
			    who = 0
			  else
			    who+= 1
			  end   	    
      end  	  
    end 
  end
  
  
  	
  
  def winner_blessing(who)
    puts "--What a Game!---------------------"
    puts "----And the winner------------------------"
    puts "--------of this furious Battle is : #{@name[who]}"
    
    puts "------------------------"
  end
end
