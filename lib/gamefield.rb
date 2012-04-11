require 'logic'
require 'player'
class GameField

	def initialize()
		
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
	def create_gamefield_array
	
	
	@field = arrays(8,8)		
		i=0

		while i < 8 do
			j=0
			
			while j < 8 do
	  			@field[i][j] = "."
				 j+=1
			
			end
			i+=1
		end
		
		@field.each
		return @field
	end
	# Print the field in his current state with all changes which appeared during the game
	def print_game_field(out, field)


  	out.puts  "/--------------------------------\\" 
        out.print "| " 

 	PrintRow(out, 1, field)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

	PrintRow(out, 2, field)

  		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

	PrintRow(out, 3, field)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

	PrintRow(out, 4, field)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

 	PrintRow(out, 5, field)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

  	PrintRow(out, 6, field)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 
  
	PrintRow(out, 7, field)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

	PrintRow(out, 8, field)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

  
	out.puts "\\----------------------------------/" 

	    	
	end


  def print_row(out, row, field)
    column = 1
    1.upto(8) do 
      print_field(column, row, field)
      out.print " | " unless column == 8
    column += 1
  end

  def print_field(column, row, field)

	print field[row][column]
  end
  
#Add an Object in the current 2 dimensional Array
# Primary the column is important since the Method walks the Column down till an Element is found
def add_object( column, object ,field)
  # not allowed if the Column is full
  allowed = true
  i=0
	if field[i][column] == '.'
		while i<8
		# this loop exist to step the column down till there is an Element. 
		# Is an Element found then the new Element will be INstern before the existing
		 if 

		 end
  
		 if field[i+1][column] !== '.'
			field[i][column] = object
			break
		   else i +=1
		end   
	else print " Column is Full, choose another"
		
end




end

	


