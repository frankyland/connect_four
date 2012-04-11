#Erzeugen eines Arrays der Als Spalte des Spielfeldes fungieren soll
class ArrayColumn
	
	def  arrays(rows,cols) 
		a= Array.new(rows)
		a.map!{Array.new(cols)}
	end
	
end
