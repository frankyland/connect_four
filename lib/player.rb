require 'logic'
class Player
	
	def initialize()
		@logic = Logic.new
		@name = Array.new
	end
	

  
  #Enter a name for each player
  def set_player(input)
      i=0
      
     
      
      while i <2
      print "Please enter your name : "
        
        @name[i] = input.gets
        
        i+=1
  
      end      
     
  end  
  
  def player
    @name
  end  
end
