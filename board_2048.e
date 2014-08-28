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
			i: INTEGER
			j: INTEGER
			k: INTEGER
			can_move: BOOLEAN
		do
			if(nr_of_filled_cells/=(columns*rows))
			then
				-- The board has free cell/s
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
			else
				-- No free cells in the board can't move
				Result := False
			end
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



end
