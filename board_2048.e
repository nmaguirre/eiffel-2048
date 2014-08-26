note
	description: "Class that represents the state of the 2048 game. It takes care of the logic of the game too."
	author: ""
	date: "August 25, 2014"
	revision: "0.01"

class
	BOARD_2048

inherit
	ANY
		redefine
			out
		end

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
		local
		    random_sequence : RANDOM
			first_random_cell_row : INTEGER
			first_random_cell_col : INTEGER
			second_random_cell_row : INTEGER
			second_random_cell_col : INTEGER

			first_random_value_cell: INTEGER
			second_random_value_cell: INTEGER
			first_cell: CELL_2048
			second_cell: CELL_2048
		do
			make_empty()
			create random_sequence.make;

			from
				first_random_cell_row := random_sequence.next_random(0) \\ 4;
				first_random_cell_col := random_sequence.next_random(0) \\ 4;
				second_random_cell_row := random_sequence.next_random(0) \\ 4;
				second_random_cell_col := random_sequence.next_random(0) \\ 4;
			until
				first_random_cell_row /= second_random_cell_row or first_random_cell_col /= second_random_cell_col
			loop
				first_random_cell_row := random_sequence.next_random(0) \\ 4;
				first_random_cell_col := random_sequence.next_random(0) \\ 4;
				second_random_cell_row := random_sequence.next_random(0) \\ 4;
				second_random_cell_col := random_sequence.next_random(0) \\ 4;
			end


			first_random_value_cell := (random_sequence.next_random(0) \\ 2 + 1) * 2;
			second_random_value_cell := (random_sequence.next_random(0) \\ 2 + 1) * 2;

			create first_cell.make_with_value (first_random_value_cell)
			create second_cell.make_with_value (second_random_value_cell)

			elements.put (first_cell, first_random_cell_row, first_random_cell_col)
			elements.put (second_cell, second_random_cell_row, second_random_cell_col)
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

	out: STRING
		-- Provides a string representation of the board

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
