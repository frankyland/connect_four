require 'logic'
require 'player'
require 'nestedhasharray.rb'

class GameField

	def initialize()
		@nha = SparseArray.new
		@player_x = Player.new(:x)
		@player_o = Player.new(:o)
	end
 
	def player 
		[@player_x, @player_o]
	end 
	
	
	# "create_gamefield_array" defined a 2 dimensional Array and fill it with a Symbol to
        # define "nil" on the gamefield.
	# The Method returns the Gamefield
	def create_gamefield_array
			
		i=0

		while i < 8 do
			j=0
			
			while j < 9 do
	  			@nha[i][j] ="."
				 j+=1	
					
			end
			i+=1
		end
		
		
	
	end
	# Print the field in his current state with all changes which appeared during the game
	def print_game_field()
    i=1

  	puts  "/--------------------------------\\" 
    print "| " 
    while i < 9 do
	    print_row( i)

  		puts " |" 
		  puts  "|---|---|---|---|---|---|---|---|" 
	  	print "| " 
      i+=1
    end

  


	    	
	end

  #Print the line with the current field Element 
  def print_row(row)
    column = 1
		i= 0

    while i< 8 do 
      # Printing each field from the row
              
	  	print @nha[i][column]
      print " | " unless column ==8
      column += 1
	  	i+=1
		end
  end

  
  #Add an Object in the current 2 dimensional Array
  # Primary the column is important since the Method walks the Column down till an Element is found
  def add_object(player, object)
    found = true
    i=0
    number = object.to_i
	#  if @field[1][object]== '.'
		 
      
       true
	 # end		
  end
  
  # This Method test, if the Game Field is empty or not
  def empty_space(counter)
    if counter == 64
      return true
    else   
      false
    end
  end    
    
  #If the column is full the method return false, if there is stil space , true
  #So if the column is full no element can enter there 
  def full_column(column)
    i=0
    while i<8 do
    
      if @nha[i][column] == "."
        return true
      else
        false
      end    
      i+=1
    end
  end 

   # This Method walks through the 2 dimensional Array to check if there is  a Line with
  def walkthrough(i, j, object)
		counter_right, counter_right_down, counter_down, counter_left_down = 0
		right, left_down, down, right_down= false
	  if @nha[i][j] != '.'  
		  if @nha[i][j+(counter-1)] == object
		  	
		  	right = walkthrough_right(i,j,counter)
		  end
		  if @nha[i+(counter-1)][j+(counter-1)]	== @nha[i+counter][j+counter]
		  	
		  	right_down = walkthrough_right_down(i,j,counter)
		  end
		  if @nha[i+(counter-1)][j]	== object
		  	c
		  	down = walkthrough_down(i,j,counter)
		  end
  
		  if i and j > 0
		  	if @nha[i+(counter-1)][j]	== object
		  		
		  		left_down = walkthrough_left_down(i,j,counter_left_down)
		  	end
		  end
  
      #If one of them is true, there is a win chance
		  if right== true or right_down==true or down == true or left_down == true
		  	return true
		  else 
		  	return false
		  end
	  end
	end
  # Rekursiv function to walk through the array and find a win situation
	def walkthrough_right( i, j, counter_right)
		if counter_right == 4
			return true
		end
		
		if @nha[i][j+(counter-1)] == @nha[i][j+counter]
			counter_right +=1
			walkthrough_right(i,j,counter_right)
		else 
			return false
		end

	end
  # Rekursiv function to walk through the array and find a win situation
	def walkthrough_right_down( i, j, counter_right_down)
		if counter_right_down == 4
			return true
		end

		if @nha[i+(counter-1)][j+(counter-1)]	== @nha[i+counter][j+counter]
			counter_right_down +=1
			walkthrough_right_down(i,j,counter_right_down)
		else 
			return false
		end
	end

  # Rekursiv function to walk through the array and find a win situation
	def walkthrough_down( i, j, counter_down)
		if counter_down == 4
			return true
		end
	    
		if @nha[i+(counter-1)][j] == @nha[i+counter][j]
			counter_down +=1
			walkthrough_down(i,j,counter_down)
		  else 
			return false 
		end
	end
	
  # Rekursiv function to walk through the array and find a win situation
	def walkthrough_left_down( i, j, counter_left_down)
		if counter_left_down == 4
			return true
		end

		if @nha[i-(counter-1)][j-(counter-1)]	== @nha[i-counter][j-counter]
			counter_left_down +=1
			walkthrough_left_down(i,j,counter_right_down)
		  else 
		 return false
		end

	end

end
