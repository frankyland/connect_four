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
	
	def  arrays(rows,cols) 
		a= Array.new(rows)
		a.map{Array.new(cols)}
	end
	def CreateGameFieldArray
	
	
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

	def CreateGameField(out, field)


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
  

def add_object( column, object ,field)
  # not allowed if the Column is full
  allowed = true
  i=0
	if field[i][column] == '.'
		while i<8
		   if field[i+1][column] !== '.'
			field[i][column] = object
			break
		   else i +=1
		end   
	else print " Column is Full, choose another"
		
end



def TheEnd?(turn)
  turn == nil ? false : zuege.size >= 9
end

# Lässt 2 Spieler miteinander spielen
def TwoPLayerGame(out, on, field)
  player = [[:First_Player, 'X'], [:Second_player, 'O']]
  who = 0
  while true
    act_turn_right = false
    until act_turn_right
      out.print "#It's {player[who][1]} turn: "
      number = on.gets.to_i
      break if number == 0
      act_turn_right = add_object( column, number, field)
    end
    CreateGameField(out, field)
    break if TheEnd?(field) or !act_turn_right
    who += 1
    who %= 2
  end
  player[who]
end


end

	


