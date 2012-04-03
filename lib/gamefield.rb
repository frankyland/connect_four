require 'column'

class GameField
   logic_object = new.Logic
   def CreateField
    #Start Index for the Koordinate of the Field
    i,j = 0
    
    # Definition for Field rows and columns
    ROWS = 8
    COLS = 8
    #column = new.column
    game_field= new.Array[].new.ArrayColumn(COLS)
    while i < ROWS do
    j=0
    game_field[i].array_column
         while j < COLS do
		game_field[i].array_column[j] = '.'
	 end
    end
    

   end
  
  end
	# Generate the current Field into the Console
	def showField

	puts game_field
	end
		
		
   
	
  end
