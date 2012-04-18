require 'logic'
require 'player'

class GameField

	def initialize()
		@logic_object = Logic.new
		@player_x = Player.new(:x)
		@player_o = Player.new(:o)
	end
 
	def player 
		[player_x, player_o]
	end 
	
	# The Method create a 2 dimensional Array for the Information needed for for every turn.
  def  arrays(rows,cols) 
    a= Array.new(rows)

    a.map{Array.new(cols)}
  end
	
	# "create_gamefield_array" defined a 2 dimensional Array and fill it with a Symbol to
        # define "nil" on the gamefield.
	# The Method returns the Gamefield
	def create_gamefield_array(field)
	
	
			
		i=0

		while i < 8 do
			j=0
			
			while j < 8 do
	  			field[i][j] ="."
				 j+=1	
					
			end
			i+=1
		end
		
		
		@field = field
	end
	# Print the field in his current state with all changes which appeared during the game
	def print_game_field()
    i=1

  	puts  "/--------------------------------\\" 
    print "| " 
    while i < 9 do
	    print_row( i)

  		out.puts " |" 
		  out.puts  "|---|---|---|---|---|---|---|---|" 
	  	out.print "| " 
      i+=1
    end

  
	puts "\\----------------------------------/" 

	    	
	end

  #Print the line with the current field Element 
  def print_row(row)
    column = 1
		i= 0

    while i< 8 do 
      # Printing each field from the row
              
	  	print @field[i][column]
      print " | " unless column ==8
      column += 1
	  	i+=1
		end
  end

      
  
  #Add an Object in the current 2 dimensional Array
  # Primary the column is important since the Method walks the Column down till an Element is found
  def add_object( column, object)
         i=0
	  if @field[i][column] == '.'
		  while i<8 do
		  # this loop exist to step the column down till there is an Element. 
    # Is an Element found then the new Element will be INstern before the existing
	      if @field[i+1][column] != '.'
			    @field[i][column] = object
			  break
			    i +=1
		    end
		  end 
      @logic_object.walkthrough(
      
      
      
	  end		
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
    
      if @field[i][column] == "."
        return true
      else
        false
      end    
      i+=1
   end
end
