note
	description: "Class that represents the state of the 2048 game. It takes care of the logic of the game too."
	author: ""
	date: "August 25, 2014"
	revision: "0.01"

class
	BOARD_2048

create
	make, make_empty

feature {ANY}

	elements: ARRAY2 [CELL_2048]
		-- Stores the game board. Indices for cells must go from 1 to 4, both
		-- for rows and for columns.

feature -- Initialisation

	make_empty
		-- there is not pre-condition

		-- Creates an empty board of 4x4 cells (all cells with default value)
		local
			default_cell: CELL_2048
			i : INTEGER
			j : INTEGER
		do
			from
				i := 1
			until
				i <= 4
			loop
				from
					j:= 1
				until
					j<=4
				loop
					create default_cell.make
					elements.put (default_cell, i, j)
					j := j+1
				end
				i:i+1
			end

		ensure
			count: elements.count = 16 and elements.all_default

		end

		-- Board Constructor

	make
		-- Creates a board of 4x4 cells, with all cells with default value (unset)
		-- except for two randomly picked cells, which must be set with eithers 2 or 4.
		-- Values to set the filled cells are chosen randomly. Positions of the two filled
		-- cells are chosen randomly.
		do
		end

feature -- Status report

	rows: INTEGER
		-- Number of rows in the board
		-- Should be constantly 4

	columns: INTEGER
		-- Number of columns in the board
		-- Should be constantly 4

	nr_of_filled_cells: INTEGER
		-- Returns the number of filled cells in the board



feature -- Status setting

	set_cell (row: INTEGER; col: INTEGER; value: INTEGER)
			-- Set cell in [row,col] position with a given value
		require
			-- WRONG PRECONDITION REMOVED
		do
			elements.item (row, col).set_value (value)
		ensure
			-- POSTCONDITION MUST NOT USE TWO_POTENCY
			-- elements.item (row, col).two_potency (value) and elements.item (row, col).value >=0 and elements.item (row, col).value >=1
		end

feature {NONE} -- Auxiliary routines



end
