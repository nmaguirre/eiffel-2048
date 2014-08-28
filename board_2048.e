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

			first_cell: CELL_2048
			second_cell: CELL_2048

		do
			make_empty()

			--initialize random seed
		    create random_sequence.set_seed (get_random_seed())

			--generate two different random positions
			from
				first_random_cell_row  := get_random (random_sequence, 4) + 1;
				first_random_cell_col  := get_random (random_sequence, 4) + 1;
				second_random_cell_row := get_random (random_sequence, 4) + 1;
				second_random_cell_col := get_random (random_sequence, 4) + 1;
			until
				first_random_cell_row /= second_random_cell_row or first_random_cell_col /= second_random_cell_col
			loop
				second_random_cell_row := get_random (random_sequence, 4) + 1;
				second_random_cell_col := get_random (random_sequence, 4) + 1;
			end

			-- create cells

			create first_cell.make_with_value (get_random_cell_two_or_four (random_sequence))
			create second_cell.make_with_value (get_random_cell_two_or_four (random_sequence))

			-- puts cells
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
		local
			i: INTEGER
			j: INTEGER
			output: STRING
		do
			output:=""
			from
				i:= 0
			until
				i< 4
			loop
				from
					j:= 0
				until
					j< 4
				loop
					output.append_string ("|")
					output.append_string (elements.item (i, j).out)
				end
					output.append_string ("|")
					output.append_string("\n")
			end
			Result := output
		end

	is_full: BOOLEAN
		-- Indicates if all cells in the board are set or not
		do
			if nr_of_filled_cells = 16 then -- Board is full when all 16 cells are filled
				Result := True
			else
				Result := False
			end
		ensure Result = (nr_of_filled_cells = 16)
		end

	can_move_left: BOOLEAN
		-- Indicates whether the board would change through a movement to the left

	can_move_right: BOOLEAN
		-- Indicates whether the board would change through a movement to the right

	can_move_up: BOOLEAN
		-- Indicates whether the board would change through an up movement
		require
			elements /= Void and rows >=2
		local
			i,j,k: INTEGER
			can_move: BOOLEAN
		do
			from
				i := 0
			until
				i > columns or can_move
			loop
				from
					j := rows - 1
					k := rows - 2
				until
					k <= 0 or can_move
				loop
					if(elements.item (j, i).value = elements.item (k, i).value or elements.item(k, i).value = 0 )
					then
						-- Two cells have the same value or the cell of up is a free cell
						can_move := True
					end
					j := k
					k := k-1
				end
				i := i+1
			end
			Result := can_move
		end

	can_move_down: BOOLEAN
		-- Indicates whether the board would change through a down movement

	is_winning_board: BOOLEAN
		-- Indicates whether 2048 is present in the board, indicating that the board is a winning board

feature -- Status setting

	set_cell (row: INTEGER; col: INTEGER; value: INTEGER)
			-- Set cell in [row,col] position with a given value
		require
			row>=1 and col>=1 and elements.item (row,col).is_valid_value (value)
		do
			elements.item (row,col).set_value (value) --Set the new value in cell
		ensure
			elements.item (row,col) = value --Must ensure that cell has the correct value
		end

feature {NONE} -- Auxiliary routines

	get_random_cell_two_or_four (random_sequence: RANDOM) : INTEGER
		local
			random_value: INTEGER

		do
			random_value := (get_random (random_sequence, 2) + 1) * 2
			Result := random_value
		end

	get_random_seed() : INTEGER
		local
			l_time: TIME
	    	l_seed: INTEGER
		do
			create l_time.make_now
		    l_seed := l_time.hour
		    l_seed := l_seed * 60 + l_time.minute
		    l_seed := l_seed * 60 + l_time.second
		    l_seed := l_seed * 1000 + l_time.milli_second
		    Result := l_seed
		end

	get_random (random_sequence: RANDOM; ceil: INTEGER) : INTEGER
		--
		require
			ceil >= 0
		do
			random_sequence.forth
			Result := random_sequence.item \\ ceil;
		ensure
			Result < ceil
		end

end
