note
	description: "Summary description for {BOARD_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class

	BOARD_2048 [T->CELL_2048]

creation

    make

feature {ANY}

	 elements : ARRAY[ARRAY[T]]

feature

	--dimensions
 	lines : INTEGER
 	columns : INTEGER

 	-- Board Constructor
 	make(n, m : INTEGER) is
    -- Create a matrix with n x m dimensions, with all elements initialized with the default value of T

 	require
 		positive: n = 4 and m = 4

 	local
 		i : INTEGER
 		aux : ARRAY[T]
 	do
 		lines := n
 		columns := m
 		!!elements.make(1,columns)

 		from i:=1

 		until i > columns

 		loop
 			!!aux.make(1, lines)
 			elements.put(aux,i)
 			i := i + 1
 	end

 	ensure
 		dimensions : lines = n and columns = m

end
