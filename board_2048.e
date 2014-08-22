note
	description: "Summary description for {BOARD_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class

	BOARD_2048

create

    make, make_empty

feature {ANY}

	 elements : ARRAY2[CELL_2048]

feature

	--dimensions
 	lines : INTEGER
 	columns : INTEGER

	make_empty
	do

	end

 	-- Board Constructor
 	make(n, m : INTEGER)
    -- Create a matrix with n x m dimensions, with all elements initialized with the default value of T

 	require
 		positive: n = 4 and m = 4

 	local
 		i : INTEGER
 	do


 	ensure
 		dimensions : lines = n and columns = m
	end


feature

	set_cell(row: INTEGER; col: INTEGER; value: INTEGER)
	do

	end
	
feature -- Status report

	nr_of_filled_cells: INTEGER

end
