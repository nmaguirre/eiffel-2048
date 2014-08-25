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
		-- Creates an empty board of 4x4 cells (all cells with default value)
		local
			default_cell: CELL_2048
		do
			create default_cell.make
			create elements.make_filled (default_cell, 4, 4)
		end

		-- Board Constructor

	make
		-- Creates a board of 4x4 cells, with all cells with default value (unset)
		-- except for two randomly picked cells, which must be set with either 2 or 4.
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

	initialise
		local
			i, j, a, b: INTEGER
		do
			from
				i := generatePosition
				j := generatePosition
			until
				elements.item (i, j).value = 0
			loop
				i := generatePosition
				j := generatePosition
			end
			a := generateValue
			b := generateValue
			elements.item (i, j).set_value (a)
			from
				i := generatePosition
				j := generatePosition
			until
				elements.item (i, j).value = 0
			loop
				i := generatePosition
				j := generatePosition
			end
			elements.item (i, j).set_value (b)
		end

	generatePosition: INTEGER
		local
			a: INTEGER
			random: RANDOM
			seconds: C_DATE
		do
			create random.make
			create seconds.default_create
			random.set_seed (seconds.second_now)
			a := (random.next_random (seconds.second_now) \\ 100)
			if a < 25 then
				a := 1
			end
			if (a > 25 and a < 50) then
				a := 2
			end
			if (a > 50 and a < 75) then
				a := 3
			end
			if (a > 75 and a < 100) then
				a := 4
			end
			Result := a
		end

	generateValue: INTEGER
		local
			a: INTEGER
			random: RANDOM
			seconds: C_DATE
		do
			create random.make
			create seconds.default_create
			random.set_seed (seconds.second_now)
			a := (random.next_random (seconds.second_now) \\ 100)
			if a < 50 then
				Result := 2
			else
				Result := 4
			end
		end


end
