require 'nestedhasharray'
require 'logic'
require 'player'

class GameField

	def initialize()
    @one= @two= @three=@four=@five=@six=@seven=@eight=8	  
		@nha = SparseArray.new
		@nha2 = SparseArray.new
#		@player_x = Player.new(:x)
	#	@player_o = Player.new(:o)
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
	
	# @nha = arrays(8,8)
			
		i=0

		while i < 8  do
			j=0
			
			while j < 9 do
	  			@nha[i][j] ="."
				#  @nha2[i][j]="."
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
		  while j<9 do
		    
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
    i=1

 
    
    while i < 9 do
	   print "|"
	    print_row( i)
      i+=1
      puts "|"
    end
    puts "|12345678|"
  


	    	
	end

  #Print the line with the current field Element 
  def print_row(row)
    column = 1
		i= 0

    while i< 8 do 
      # Printing each field from the row
              
	  	print @nha[i][row]
      
      
	  	i+=1
		end
  end
  
  
  #Add an Object in the current 2 dimensional Array
  # Primary the column is important since the Method walks the Column down till an Element is found
  def add_object(who, number)
    
    
    case number
      when 1
        if @one != 0
          insert(number, @one, who)
          @one= @one -1
        
        else 
          puts "Please choose another column"
        end
        
      when 2
        if @two != 0
          insert(number, @two, who)
          @two= @two-1
        else
          puts "Please choose another column"
        end
        
      when 3
        if @three != 0
          insert(number, @three, who)
          @three=@three -1
        else
          puts "Please choose another column"
        end
        
      when 4
        if @four != 0
          insert(number, @four, who)
          @four=@four-1
        else
          puts "Please choose another column"
        end
        
        
      when 5
        if @five != 0
          insert(number, @five, who)
          @five=@five-1
        else
          puts "Please choose another column"
        end
        
      when 6
        if @six != 0
          insert(number, @six, who)
          @six=@six-1
        else
          puts "Please choose another column"
        end
        
      when 7
        if @seven != 0
          insert(number, @seven, who)
          @seven=@seven-1
        else
          puts "Please choose another column"
        end
        
      when 8
        if @eight != 0
          insert(number, @eight, who)
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
  def insert(number, counter, who)
    
    @nha[number-1][counter] = act_player[who]
    
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
	  if @nha[i][j] != "."  
		  if @nha[i][j] == object
		    if (j+1)<9
		      if @nha[i][j+1] == object
		  	    counter_right= counter_right +1
		  	    right = walkthrough_right(i,j,counter_right)
		  	    if right== true 
		  	      return true
		        end
		      end
		    end  
		    if ((i+1)<9) or ((j+1)<9)
		      if @nha[i+1][j+1]	== object
		  	    counter_right_down = counter_right_down +1
		  	    right_down = walkthrough_right_down(i,j,counter_right_down)
            if right_down==true 
		  	      return true
		        end		    
		      end
		    end  
		    if (i+1)<9
		      if @nha[i+1][j]	== object
		  	    counter_down = counter_down+1
		  	    down = walkthrough_down(i,j,counter_down)
		  	    if down == true
		  	      return true
		        end
		      end
        end
		    if (i+1) < 9 and (j-1) > 0
		  	  if @nha[i+1][j-1]	== object
		  		  counter_left_down= counter_left_down+1
		  	  	left_down = walkthrough_left_down(i,j,counter_left_down)
		  	    if left_down == true
		  	      return true
		        end
		  	  end
		    end
  
        #If one of them is true, there is a win chance
		    if right== false and right_down==false and down == false and left_down == false
		  	  return false
		    end
		  end  
	  end
	end
  # Rekursiv function to walk through the array and find a win situation
	def walkthrough_right( i, j, counter_right)
		if counter_right == 4
			return true
		end
		
		if @nha[i][j+counter_right-1] == @nha[i][j+counter_right]
			counter_right= counter_right +1
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

		if @nha[i+(counter_right_down-1)][j+(counter_right_down-1)]	== @nha[i+counter_right_down][j+counter_right_down]
			counter_right_down= counter_right +1
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
	    
		if @nha[i+(counter_down-1)][j] == @nha[i+counter_down][j]
			counter_down= counter_right+1
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

		if @nha[i-(counter_left_down-1)][j-(counter_left_down-1)]	== @nha[i+counter_left_down][j+counter_left_down]
			counter_left_down= counter_left_down+1
			walkthrough_left_down(i,j,counter_right_down)
		  else 
		 return false
		end

	end

end

