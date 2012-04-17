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
return a.map{Array.new(cols)}
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
	def print_game_field(out)


  	out.puts  "/--------------------------------\\" 
        out.print "| " 

 	print_row(out, 1)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

	print_row(out, 2)

  		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

	print_row(out, 3)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

	print_row(out, 4)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

 	print_row(out, 5)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

  	print_row(out, 6)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 
  
	print_row(out, 7)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

	print_row(out, 8)

		out.puts " |" 
		out.puts  "|---|---|---|---|---|---|---|---|" 
		out.print "| " 

  
	out.puts "\\----------------------------------/" 

	    	
	end


        def print_row(out, row)
                column = 1
		i= 0
		row
               while i< 8 do 
              
		out.print @field[i][column]
                out.print " | " unless column ==8
                column += 1
		i+=1
		end
        end

      
  
        #Add an Object in the current 2 dimensional Array
        # Primary the column is important since the Method walks the Column down till an Element is found
        def add_object( column, object ,field)
         i=0
	    if field[i][column] == '.'
		while i<8 do
		# this loop exist to step the column down till there is an Element. 
		# Is an Element found then the new Element will be INstern before the existing
  
		 if field[i+1][column] != '.'
			field[i][column] = object
			break
			i +=1
		 end
		end 

	    end		
        end

end
