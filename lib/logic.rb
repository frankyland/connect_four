require 'gamefield'
class Logic
  def initialize
	@game_field = GameField.new
  end

  def two_player_game(out, on)
	@game_field.print(out) 
  	
	winner = game_over
	end_turn= !@gamefield.n_field? or ( winner != nil)
	player =@game_field.player

	
	out.print   "Please Enter X or O for the game"
	insert =  on.gets.downcase.chomp
	who = nil
	who = (enter == 'x') ? 1 : 0

	while true
		turn_right = false
		until turn_right
			out.print " It's #{spieler[wer]} turn:" 
			number = on.gets.to_i
			 if number == 0
				break
			 end
			turn_right= @game_field.add_object(Logic.new(player[who], number))
		end
		@game_field.print( out)
		winner = game_over(player[who], field)
		end_turn= !@gamefield.free_field? or ( winner != nil)
			break if (end_turn or !turn_right)
			who +=1
			who %2

	end
	
	if winner != nil
		return  player[who]
	else
		return nil
	end
end

	def game_over(player, field)
		i,j =0
		counter = 1
		
		while i < 8 
			
			j =0
			while j<8
				if field[i][j] == object
					the_winner = walktrough(field,i,j)
				end
			end
		end
		return the_winner
	end
		

	def walkthrough(field, i, j)
		counter_right, counter_right_down, counter_down, counter_left_down = 0
		right, left_down, down, right_down= false
		if field[i][j+(counter-1)] == field[i][j+counter]
			counter_right +=1
			right = walkthrough_right(field,i,j,counter)
		end
		if field[i+(counter-1)][j+(counter-1)]	== field[i+counter][j+counter]
			counter_right_down +=1
			right_down = walkthrough_right_down(field,i,j,counter)
		end
		if field[i+(counter-1)][j]	== field[i+counter][j]
			counter_down +=1
			down = walkthrough_down(field,i,j,counter)
		end

		if i and j > 0
			if field[i+(counter-1)][j]	== field[i+counter][j]
				counter_left_down +=1
				left_down = walkthrough_left_down(field,i,j,counter_left_down)
			end
		end

		if right== true or right_down==true or down == true or left_down == true
			return true
		else 
			return false
		end
	
	end

	def walkthrough_right(field, i, j, counter_right)
		if counter_right == 4
			return true
		end
		
		if field[i][j+(counter-1)] == field[i][j+counter]
			counter_right +=1
			walkthrough_right(field,i,j,counter_right)
		  else 
			return false
		end

	end

	def walkthrough_right_down(field, i, j, counter_right_down)
		if counter_right_down == 4
			return true
		end

		if field[i+(counter-1)][j+(counter-1)]	== field[i+counter][j+counter]
			counter_right_down +=1
			walkthrough_right_down(field,i,j,counter_right_down)
		  else 
			return false
		end
	end

	def walkthrough_down(field, i, j, counter_down)
		if counter_down == 4
			return true
		end
	    
		if field[i+(counter-1)][j] == field[i+counter][j]
			counter_down +=1
			walkthrough_down(field,i,j,counter_down)
		  else 
			return false 
		end
	end
	
	def walkthrough_left_down(field, i, j, counter_left_down)
		if counter_left_down == 4
			return true
		end

		if field[i-(counter-1)][j-(counter-1)]	== field[i-counter][j-counter]
			counter_left_down +=1
			walkthrough_left_down(field,i,j,counter_right_down)
		  else 
			return false
		end

	end




end
