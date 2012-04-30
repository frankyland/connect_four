require 'nestedhasharray'
require 'logic'
require 'player'

class GameField

	def initialize()
    @one= @two= @three=@four=@five=@six=@seven=@eight=7
	  @x=0
		@nha = SparseArray.new
		@nha2 = SparseArray.new
		@turns = SparseArray.new
    @turn = Array.new
	end
 	
	# "create_gamefield_array" defined a 2 dimensional Array and fill it with a Symbol to
  # define "nil" on the gamefield.
	# The Method returns the Gamefield
	def create_gamefield_array
	
		i=0
		while i < 8  do
			j=0
			
			while j < 8 do
			  #Copy the "." object in the actual Position of the 2 dimensional Array 
	  	  @nha[i][j] ="."		
				j+=1		
			end
			i+=1
		end
	end	
	
	# Fuse the Array with the elements x and o with an array with points so the field has a visual brighter sightf
	def fuse
		i,j=0
		while i<8 do  
		  j=0
		  while j<8 do
		    
		    if @nha[i][j] == nil
		      @nha[i][j] ="."   
		    end
		    j+=1
		  end  
		  i+=1
		end  
		
	end
	
	# Print the field in his current state with all changes which appeared during the game
	def print_game_field()

    i=0
    while i < 8 do
	    print "|"
	    print_row( i)
      i+=1
      puts "|"
    end
    puts "|12345678|"	    	
	end

  #Print the line with the current field Elements 
  def print_row(row)
    column = 1
		i= 0

    while i< 8 do 
      # Printing each field from the row        
	  	print @nha[i][row]
	  	i+=1
		end
  end
  
  
  # Add an Object in the current 2 dimensional Array
  # Primary the column is important since the Method walks the Column down till an Element is found
  def add_object(who, number)
    # A Case structure that catches the Column number the player type in the console
    # It choose from eight case events, which can be every number from 1 till 8   
    case number
      when 1
        # Catch up the fact, that the column can be full if that case will be run through 8 Times
        if @one >=0
          insert(number, @one, who)
          @turn[0] = @one
          @turn[1] = number
          @turn[2] = act_player[who]
          @one= @one -1
        else 
          puts "Please choose another column"
        end
        
      when 2
        # Catch up the fact, that the column can be full if that case will be run through 8 Times
        if @two >=0
          insert(number, @two, who)
          @turn[0] = @two
          @turn[1] = number
          @turn[2] = act_player[who]
          @two= @two-1
        else
          puts "Please choose another column"
        end
        
      when 3
        # Catch up the fact, that the column can be full if that case will be run through 8 Times
        if @three >=0
          insert(number, @three, who)
          @turn[0] = @three
          @turn[1] = number
          @turn[2] = act_player[who]
          @three=@three -1
        else
          puts "Please choose another column"
        end
        
      when 4
        # Catch up the fact, that the column can be full if that case will be run through 8 Times
        if @four >=0
          insert(number, @four, who)
          @turn[0] = @four
          @turn[1] = number
          @turn[2] = act_player[who]
          @four=@four-1
        else
          puts "Please choose another column"
        end
        
        
      when 5
        # Catch up the fact, that the column can be full if that case will be run through 8 Times
        if @five >=0
          insert(number, @five, who)
          @turn[0] = @five
          @turn[1] = number
          @turn[2] = act_player[who]
          @five=@five-1
        else
          puts "Please choose another column"
        end
        
      when 6
        # Catch up the fact, that the column can be full if that case will be run through 8 Times
        if @six >=0
          insert(number, @six, who)
          @turn[0] = @six
          @turn[1] = number
          @turn[2] = act_player[who]
          @six=@six-1
        else
          puts "Please choose another column"
        end
        
      when 7
        # Catch up the fact, that the column can be full if that case will be run through 8 Times
        if @seven >=0
          insert(number, @seven, who)
          @turn[0] = @seven
          @turn[1] = number
          @turn[2] = act_player[who]
          @seven=@seven-1
        else
          puts "Please choose another column"
        end
        
      when 8
        # Catch up the fact, that the column can be full if that case will be run through 8 Times
        if @eight >=0
          insert(number, @eight, who)
          @turn[0] = @eight
          @turn[1] = number
          @turn[2] = act_player[who]
          @eight=@eight-1
        else
          puts "Please choose another column"
        end
        
      else print "no such number"
    end
    fuse()
  end
  def act_player
	  ["x","o"]
	end
 
  # Insert the Object in 2 Arrays, one that is shown of and the other for search for the Winner of the Game. 
  def insert(number, counter, who)
    # Printed Array
    @nha[number-1][counter] = act_player[who]
    # Search through Array
    @nha2[number-1][counter] = act_player[who]
  
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
    # Look if there is an full column
    case column
      when 1
        if @one < 0 
         return true
        else
          return false
        end    
      when 2
        if @two < 0 
          return true
        else
          return false
        end    
      when 3
        if @three < 0 
          return true
        else
          return false
        end
      when 4
        if @four < 0 
          return true
        else
          return false
        end
      when 5
        if @five < 0 
          return true
        else
          return false
        end
      when 6
        if @six < 0 
          return true
        else
          return false
        end
      when 7
        if @seven < 0 
          return true
        else
          return false
        end
      when 8
        if @eight < 0 
          return true
        else
          return false
        end
    end 
  end 

   # This Method walks through the 2 dimensional Array to check if there is  a Line with
  def walkthrough()
    choose_winner =false   
    choose_winner= walkthrough_test( @turn[2])
 
	  if choose_winner ==true
	    return true
	  else
	    return false
	  end    
 	end
 	
  # Iterativ function to walk through the array and find a win situation
  def walkthrough_test( object)
	  counter=4
	  i,j =0
	  
	  # This Two Loops run the intire nested hash Array along
	  # Ignores all fields which are empty
	  # The loop goes for each position there an object through four Methods
	  # The Methods returns a number of found objects in a same line
	  while i < 8
	    j=0
	    while j < 8
	      
	      if @nha2[i][j] != nil
	        if @nha2[i][j] == object
	
	          ru1=   walkhigh(i,j,object)                
	          if ru1==0
	            puts "WINNNNNNNNER1"
	            return true
	            break
	          end
	      
	          ru2 =  walkright(i,j,object)
	          if ru2==0
	            puts "WINNNNNNNNER2"
	            return true
	            break
	          end
	      
	          ru3 = walkleft_down(i,j,object)
	          if ru3==0
	            puts "WINNNNNNNNER3"
	            return true
	            break
	          end
	      
	          ru4 = walkright_down(i,j,object)
	          if ru4==0
	            puts "WINNNNNNNNER4"
	            return true
	            break
	          end
	        end
	      end  
	    j+=1
	    end  
	  i+=1   
	  end
  end

  # Proofs if a horizon line holds a Win 
  def walkhigh(i,j,object)
    w=0
    counter =4
    while w < 4
      if @nha2[i][j+w] == object
        puts "high#{counter}"
        counter =counter -1
      end
      w+=1
    end
    return counter
  end
  
  # Proofs if a vertical line holds a Win
  def walkright(i,j,object)
    w=0
    counter =4
    while w < 4
      if @nha2[i+w][j] == object
        counter =counter -1
      end
    w+=1
    end
    return counter
  end
  
  # Proofs if a line from one point to point down right holds a Win
  def walkleft_down(i,j,object)
    w=0
    counter =4
    while w < 4
      if @nha2[i-w][j-w] == object
        counter =counter -1
      end
    w+=1
    end
    return counter
  end
  
  # Proofs if a line from one point to point down left holds a Win
  def walkright_down(i,j,object)
    w=0
    counter =4
    while w < 4 
     if @nha2[i-w][j+w] == object 
      counter =counter -1
      end
    w+=1
    end
    return counter
  end
  
end
