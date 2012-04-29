require 'nestedhasharray'
require 'logic'
require 'player'

class GameField

	def initialize()
    @one= @two= @three=@four=@five=@six=@seven=@eight=7
	  @x=0
	  @counter_l = 0
	  @counter_r=0
		@nha = SparseArray.new
		@nha2 = SparseArray.new
		@turns = SparseArray.new
    @turn = Array.new
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
	
	# @na = arrays(98,98)
			
		i=0

		while i < 8  do
			j=0
			
			while j < 8 do
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
        if @one >=0
          insert(number, @one, who)
          @turn[0] = @one
          @turn[1] = number
          @turn[2] = act_player[who]
          puts @turn[0]
          puts @turn[1]
          puts @turn[2]
          @one= @one -1
          turns(@turn)
        else 
          puts "Please choose another column"
        end
        
      when 2
        if @two >=0
          insert(number, @two, who)
          @turn[0] = @two
          @turn[1] = number
          @turn[2] = act_player[who]
          puts @turn[0]
          puts @turn[1]
          puts @turn[2]
          turns(@turn)
          @two= @two-1
        else
          puts "Please choose another column"
        end
        
      when 3
        if @three >=0
          insert(number, @three, who)
          @turn[0] = @three
          @turn[1] = number
          @turn[2] = act_player[who]
          puts @turn[0]
          puts @turn[1]
          puts @turn[2]
          turns(@turn)
          @three=@three -1
        else
          puts "Please choose another column"
        end
        
      when 4
        if @four >=0
          insert(number, @four, who)
          @turn[0] = @four
          @turn[1] = number
          @turn[2] = act_player[who]
          puts @turn[0]
          puts @turn[1]
          puts @turn[2]
          turns(@turn)
          @four=@four-1
        else
          puts "Please choose another column"
        end
        
        
      when 5
        if @five >=0
          insert(number, @five, who)
          @turn[0] = @five
          @turn[1] = number
          @turn[2] = act_player[who]
          puts @turn[0]
          puts @turn[1]
          puts @turn[2]
          turns(@turn)
          @five=@five-1
        else
          puts "Please choose another column"
        end
        
      when 6
        if @six >=0
          insert(number, @six, who)
          @turn[0] = @six
          @turn[1] = number
          @turn[2] = act_player[who]
          puts @turn[0]
          puts @turn[1]
          puts @turn[2]
          turns(@turn)
          @six=@six-1
        else
          puts "Please choose another column"
        end
        
      when 7
        if @seven >=0
          insert(number, @seven, who)
          @turn[0] = @seven
          @turn[1] = number
          @turn[2] = act_player[who]
          puts @turn[0]
          puts @turn[1]
          puts @turn[2]
          turns(@turn)
          @seven=@seven-1
        else
          puts "Please choose another column"
        end
        
      when 8
        if @eight >=0
          insert(number, @eight, who)
          @turn[0] = @eight
          @turn[1] = number
          @turn[2] = act_player[who]
          puts @turn[0]
          puts @turn[1]
          puts @turn[2]
          turns(@turn)
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
    @nha2[number-1][counter] = act_player[who]
  
  end 
 
  def turns(turn)
    i=0
    counter=0
    while i<3 
      @turns[i][@x] = @turn[i]
 
 
      i+=1
    end
    @x+=1
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
  def walkthrough()
    counter_right= counter_right_down= counter_down= counter_left_down = 0		
		horizon=vertical = false
		
	  horizon = choose_left_right_path(@turn[0],@turn[1],@turn[2])      
	  if horizon == true
	    return true
	  else
	    return false
	  end    
	end
  # Rekursiv function to walk through the array and find a win situation
	def choose_left_right_path(i,j,object)
	  counter_l = 0
	  counter_r=0    
	  choose_winner =0   


    walkthrough_test( object)
	 # walkthrough_left(i,j,counter_l,object)

	 # walkthrough_right(i,j,counter_r,object)
	  
	  choose_winner = @counter_r+@counter_l
	  if choose_winner > 4
	    return true
	  else
	    return false
	  end    
	end
	
	def walkthrough_left( i,j, counter_l, object)
	  puts "array element: #{@nha[i][j]}"
	  puts "object_ #{object}"
	  
	  if counter_l == 4
	    return counter_l
	  end
	  if @nha[i][j-counter_l] == object
	    counter_l+=1
	    puts "leftc: #{counter_l}"
	    walkthrough_left(i,j,counter_l,object)
	  else
	  print "bla"
	    return counter_l
	  end  
	     
	end
	
	def walkthrough_right( i, j, counter_r, object)
	  puts "array element: #{@nha[i][j]}"
	  puts "object_ #{object}"
	   if counter_r == 4
	    return counter_r
	  end
	   
	   if @nha[i][j+counter_r] == object 
	    puts "rightc: '{counter_r}"
	    counter_r+=1
	    walkthrough_right(i,j,counter_r,object)
  
	   else
	    print "la"
	    return counter_r
	   end
	end
 def walkthrough_test( object)
	counter=4
	ru =4
	i,j =0
	while i < 8
	  j=0
	  while j <8
	  
	    if @nha2[i][j] != nil
	      if @nha2[i][j] == object
	      puts "enter#{@nha2[i][j]}"
	        ru=   walkhigh(i,j,object)                
	        ru =  walkright(i,j,object)
	        if ru==0
	            puts "WINNNNNNNNER"
	            break
	        end
	      end
	    end  
	  j+=1
	  end  
	i+=1   
	end
 end

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

  def walkright(i,j,object)
     w=0
     counter =4
     while w < 4
  
      if @nha2[i+w][j] == object
       puts "right#{counter}"
      counter =counter -1
    
      end
    w+=1
    end
    return counter
  end

  


end
