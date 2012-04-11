

class NewGameField

	def  arrays(rows,cols) 
		a= Array.new(rows)
		a.map{Array.new(cols)}
	end
	def CreateGameField
	b = Array.new
	
	
	
	@a = arrays(8,8)		
		i=0

		while i < 8 do
			j=0
			
			while j < 8 do
	  			@a[i][j] ="."
				 j+=1
			#print game_field[i[j]] ="."
			#puts @a[i][j]
			
			
			end
			#print @a 
			i+=1
		end
		print @a
		@a.each
		
	end

	def ShowField
	    	
	end
end	


