module ConnectFour
  def self.hello_world
    "hello world"
  end
  class GameField

    # Constants for Field rows and columns
    Rows =8
    Cols =8

    #Start Index for the Koordinate of the Field
    i,j =0



    #Defined a 2 Dimensional Array
      def [](rows, cols)
      end

    #Filled the 8x8 Field with the "." Symbol

    while  i < Rows do

  j=0

	while j < Cols do

		cf.[](i,j) <= '.' 

		j += 1

	end

	i += i + 1

    end



  end
  
  #ToDo class player with player and turns
end