note
	description: "Class that represents the state of the 2048 game. It takes care of the logic of the game too."
	author: ""
	date: "August 25, 2014"
	revision: "0.01"

class
	BOARD_2048

inherit

	STORABLE
		redefine
			out
		end

create
	make, make_empty

feature {ANY}

	elements: ARRAY2 [CELL_2048]
			-- Stores the game board. Indices for cells must go from 1 to 4, both
			-- for rows and for columns.

	coord_last_random_cell: TUPLE [INTEGER, INTEGER]
			-- Tuple containing the coordinates of the last random cell.

feature -- Initialisation

	make_empty
			-- there is not pre-condition

			-- Creates an empty board of 4x4 cells (all cells with default value)
		local
			default_cell: CELL_2048
			i: INTEGER
			j: INTEGER
		do
			create elements.make (rows, columns)
			from
				i := 1
			until
				i > rows
			loop
				from
					j := 1
				until
					j > columns
				loop
					create default_cell.make
					elements.item (i, j) := default_cell
					j := j + 1
				end
				i := i + 1
			end
		ensure
			quantity_columns: elements.width = columns
			quantity_rows: elements.height = rows
			total_indexes: elements.count = rows * columns
			notVoid: elements /= void
		end

		-- Board Constructor

	make
			-- Creates a board of 4x4 cells, with all cells with default value (unset)
			-- except for two randomly picked cells, which must be set with eithers 2 or 4.
			-- Values to set the filled cells are chosen randomly. Positions of the two filled
			-- cells are chosen randomly.
		local
			random_sequence: RANDOM
			first_random_cell_row: INTEGER
			first_random_cell_col: INTEGER
			second_random_cell_row: INTEGER
			second_random_cell_col: INTEGER
		do
			make_empty

				--initialize random seed
			create random_sequence.set_seed (get_random_seed)

				--generate two different random positions
			from
				first_random_cell_row := get_random (random_sequence, rows) + 1;
				first_random_cell_col := get_random (random_sequence, columns) + 1;
				second_random_cell_row := get_random (random_sequence, rows) + 1;
				second_random_cell_col := get_random (random_sequence, columns) + 1;
			until
				first_random_cell_row /= second_random_cell_row or first_random_cell_col /= second_random_cell_col
			loop
				second_random_cell_row := get_random (random_sequence, rows) + 1;
				second_random_cell_col := get_random (random_sequence, columns) + 1;
			end

				-- set cells
			set_cell (first_random_cell_row, first_random_cell_col, get_random_cell_two_or_four (random_sequence))
			set_cell (second_random_cell_row, second_random_cell_col, get_random_cell_two_or_four (random_sequence))
			coord_last_random_cell := [second_random_cell_row, second_random_cell_col]
		ensure
			rows = 4 and columns = 4 and nr_of_filled_cells = 2
		end

feature -- Status report

	rows: INTEGER = 4
			-- Number of rows in the board
			-- Should be constantly 4

	columns: INTEGER = 4
			-- Number of columns in the board
			-- Should be constantly 4

	nr_of_filled_cells: INTEGER
			-- Returns the number of filled cells in the board
		require
			elements_void_in_nr_of_filled_cells_feature: elements /= Void
		local
			filled_cells: INTEGER
			i: INTEGER
			j: INTEGER
		do
			from
				i := 1
			until
				i > rows
			loop
				from
					j := 1
				until
					j > columns
				loop
					if not (elements.item (i, j).value = 0) then
						filled_cells := filled_cells + 1
					end
					j := j + 1
				end
				i := i + 1
			end
			Result := filled_cells
		end

	out: STRING
			-- provides a string representation of the board content.
		local
			i: INTEGER
			j: INTEGER
			output: STRING
		do
			from
				i := 1
				output := ""
			until
				i > rows
			loop
				from
					j := 1
				until
					j > columns
				loop
					output.append_string ("|")
					output.append_string (elements.item (i, j).out)
					j := j + 1
				end
				output.append_string ("|")
				output.append_string ("%N")
				i := i + 1
			end
			Result := output
		ensure then
			Result.count > 0
		end

	is_full: BOOLEAN
			-- Indicates if all cells in the board are set or not
		do
			Result := (nr_of_filled_cells = 16) -- Board is full when all 16 cells are filled
		ensure
			full_board: Result = (nr_of_filled_cells = 16)
		end

	can_move_left: BOOLEAN
			-- Indicates whether the board would change through a movement to the left
		require
			elements /= Void
		local
			i, j: INTEGER
			can_move: BOOLEAN
		do
			from
				i := 1
				can_move := False
			until
				i > rows or can_move
			loop
				from
					j := 2
				until
					j > columns or can_move
				loop
					if not (elements.item (i, j).value = 0) then
						if (elements.item (i, j - 1).value = 0) or (elements.item (i, j - 1).value = elements.item (i, j).value) then
								--if the cell on the left is empty or has the same value, then you can move left
							can_move := True
						end
					end
					j := j + 1
				end
				i := i + 1
			end
			Result := can_move
		end

	can_move_right: BOOLEAN
			-- Indicates whether the board would change through a movement to the right
		require
			elements /= Void
		local
			i, j: INTEGER
			move_ok: BOOLEAN
		do
			from
				i := 1
			until
				i > columns or move_ok
			loop
				from
					j := 1
				until
					(j + 1) > columns or move_ok
				loop
					if not (elements.item (i, j).value = 0) then
						if ((elements.item (i, j).value = elements.item (i, j + 1).value) or (elements.item (i, j + 1).value = 0)) then
								-- evaluates if the value is equal to the right or if value is equal 0
							move_ok := True
						end
					end
					j := j + 1
				end
				i := i + 1
			end
			Result := move_ok
		ensure
			elements /= Void and rows > 1 and columns > 1
		end

	can_move_up: BOOLEAN
			-- Indicates whether the board would change through an up movement
		require
			elements /= Void
		local
			i, j: INTEGER
			can_move, cell_occupied: BOOLEAN
		do
			from
				i := 1
			until
				i > columns or can_move
			loop
				cell_occupied := false
				from
					j := rows
				until
					j <= 1 or can_move
				loop
					if not cell_occupied then
						cell_occupied := elements.item (j, i).value /= 0
					end
					if ((elements.item (j, i).value /= 0 and elements.item (j, i).value = elements.item (j - 1, i).value) or (cell_occupied and elements.item (j - 1, i).value = 0)) then
							-- Two cells have the same value or the cell of up is a free cell
						can_move := True
					end
					j := j - 1
				end
				i := i + 1
			end
			Result := can_move
		end

	can_move_down: BOOLEAN
			-- Indicates whether the board would change through a down movement
		require
			elements /= Void
		local
			i, j: INTEGER
			can_move: BOOLEAN
		do
			from
				i := 1
				can_move := False
			until
				i > rows - 1 or can_move
			loop
				from
					j := 1
				until
					j > columns or can_move
				loop
					if not (elements.item (i, j).value = 0) then
						if (elements.item (i + 1, j).value = 0) or (elements.item (i + 1, j).value = elements.item (i, j).value) then
								--if the cell below is empty or has the same value, then you can move down
							can_move := True
						end
					end
					j := j + 1
				end
				i := i + 1
			end
			Result := can_move
		end

	is_winning_board: BOOLEAN
			-- Indicates whether 2048 is present in the board, indicating that the board is a winning board
		require
			elements.height = 4 and elements.width = 4
		local
			i, j: INTEGER
			is_winning: BOOLEAN
		do
			from
				i := 1
			until
				i > 4 or is_winning
			loop
				from
					j := 1
				until
					j > 4 or is_winning
				loop
					if (elements.item (i, j).value = 2048) then
						is_winning := True
					end
					j := j + 1
				end
				i := i + 1
			end
			Result := is_winning
		end

feature -- Movement commands

	down -- Moves the cells to the lowermost possible point of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.
		require
			can_move_down
		local
			i, j, aux: INTEGER
		do
				-- add all possible cells downward
			from -- columns
				i := 1
			until
				i > 4
			loop
				from -- rows (from the lowermost to the uppermost row)
					j := 4
				until
					j <= 1
				loop
					if elements.item (j, i).value /= 0 then
						aux := j;
						j := j - 1;
						from
								-- search for the next element /= 0
						until
							(j < 1) or (elements.item (j, i).value /= 0)
						loop
							j := j - 1;
						end
						if j >= 1 then -- if search is succesful
							if elements.item (aux, i).value = elements.item (j, i).value then
								set_cell (aux, i, (elements.item (aux, i).value + elements.item (j, i).value))
								set_cell (j, i, 0)
								j := j - 1;
							end
						end
					else
						j := j - 1;
					end -- end if /=0
				end -- end loop j
				i := i + 1;
			end -- end loop i

				--occupy all empty spaces downward
			from -- columns
				i := 1
			until
				i > 4
			loop
				from -- rows (from the lowermost to the uppermost row)
					j := 4
				until
					j = 1
				loop
					if ((elements.item (j, i).value = 0) and (elements.item (j - 1, i).value) /= 0) then -- if j,i = 0 and the one above it is =/ 0
						set_cell (j, i, elements.item (j - 1, i).value)
						set_cell (j - 1, i, 0)
						if (j < 4) then --if not at the lowermost cell
							j := j + 1; -- continues moving downward until it reaches an ocupied cell
						else
							j := j - 1; -- continues moving upward
						end
					else
						j := j - 1;
					end
				end -- end loop j
				i := i + 1;
			end -- end loop i
			set_random_free_cell
		end -- end do

	up
			-- Moves the cells to the uppermost possible point of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.
		require
			can_move_up
		local
			i, k, j: INTEGER
		do
				--First I add the cells that can be added
			from
				j := 1
			until
				j > 4
			loop
				from
					i := 1
				until
					i >= 4
				loop
					if elements.item (i, j).value /= 0 then
						k := i + 1;
						from
								-- search for the next element /= 0
						until
							(k > 4) or (elements.item (k, j).value /= 0)
						loop
							k := k + 1;
						end
						if (k <= 4) then
							if (elements.item (i, j).value = elements.item (k, j).value) then
								set_cell (i, j, (elements.item (k, j).value + elements.item (i, j).value))
								set_cell (k, j, 0)
								i := k + 1
							else
								i := k
							end
						else
							i := k
						end
					else
						i := i + 1
					end
				end --end loop i
				j := j + 1
			end --end loop j
				-- occupy available cells at the top.
			from --
				j := 1
			until
				j > 4
			loop
				from
					i := 1
				until
					i >= 4
				loop
					if elements.item (i, j).value = 0 then
						k := i + 1;
						from
								-- search for the next element /= 0
						until
							(k > 4) or (elements.item (k, j).value /= 0)
						loop
							k := k + 1;
						end
						if (k <= 4) then
							set_cell (i, j, elements.item (k, j).value)
							set_cell (k, j, 0)
							i := i + 1
						else
							i := k
						end
					else
						i := i + 1
					end
				end --end loop i
				j := j + 1
			end --end loop j
			set_random_free_cell
		end --end do

	left
			-- Moves the cells to the leftmost possible point of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.
		require
			can_move_left
		local
			i, j, k: INTEGER
		do
			from
				i := 1
			until
				i > 4
			loop
				from
					j := 1
				until
					j >= 4
				loop
					if elements.item (i, j).value /= 0 then
						k := j + 1
						from
						until
							(k > 4) or (elements.item (i, k).value /= 0)
						loop
							k := k + 1
						end
						if (k <= 4) then
							if (elements.item (i, j).value = elements.item (i, k).value) then
								set_cell (i, j, (elements.item (i, k).value + elements.item (i, j).value))
								set_cell (i, k, 0)
								j := k + 1
							else
								j := k
							end -- end if
						else
							j := k
						end
					else
						j := j + 1
					end -- end if /=0
				end --end loop j
				i := i + 1
			end --end loop i
			from --
				i := 1
			until
				i > 4
			loop
				from
					j := 1
				until
					j >= 4
				loop
					if (elements.item (i, j).value = 0) and (elements.item (i, j + 1).value /= 0) then
						set_cell (i, j, elements.item (i, j + 1).value)
						set_cell (i, j + 1, 0)
						if (j = 1) then --if at the leftrmost cell
							j := j + 1; -- continues moving to the right until it reaches an occupied cell
						else
							j := j - 1; -- continues moving left
						end
					else
						j := j + 1
					end -- end if
				end --end loop j
				i := i + 1
			end --end loop i
			set_random_free_cell
		end --end do

	right
			-- Moves the cells to the rightmost possible point of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.

		require
			can_move_right
		local
			i, j, k, v: INTEGER
		do
			from
				i := 1
			until
				i > 4
			loop
				from
					j := 4
				until
					j <= 1
				loop
					if elements.item (i, j).value /= 0 then
						if j > 1 then
							k := j - 1
							from
							until
								(k <= 1) or (elements.item (i, k).value /= 0)
							loop
								k := k - 1
							end
							if (k >= 1) then
								if (elements.item (i, j).value = elements.item (i, k).value) then
									set_cell (i, j, (elements.item (i, k).value + elements.item (i, j).value))
									set_cell (i, k, 0)
									j := k - 1
								else
									j := k
								end
							end
						end
					else
						j := j - 1
					end
				end --end loop j
				i := i + 1
			end --end loop i

			from --
				i := 1
			until
				i > 4
			loop
				from
					j := 4
				until
					j < 1
				loop
					if elements.item (i, j).value /= 0 then
						v := elements.item (i, j).value
						set_cell (i, j, 0)
						position_right (i, v)
						j := j - 1;
					else
						j := j - 1
					end --end if
				end --end loop j
				i := i + 1
			end --end loop i
			set_random_free_cell
		end --end do			


	position_right (row, val: INTEGER)
			-- Method that receives as a parameter a row, and verifies the position which is more to the right
			-- which is empty in that row and also inserts the value passed as parameter
		local
			column: INTEGER
		do
			from
				column := 4
			until
				column < 1
			loop
				if elements.item (row, column).value = 0 then
					set_cell (row, column, val)
					column := 0
				else
					column := column - 1
				end --end if
			end --end loop
		end --end do

feature -- Status setting

	set_cell (row: INTEGER; col: INTEGER; value: INTEGER)
			-- Set cell in [row,col] position with a given value
		require
			valid_range: (row >= 1 and row <= 4 and col >= 1 and col <= 4)
			valid_value: ((create {CELL_2048}.make).is_valid_value (value))
		do
			elements.item (row, col).set_value (value) --Set the new value in cell
		ensure
			elements.item (row, col).value = value --Must ensure that cell has the correct value
		end

feature {NONE} -- Auxiliary routines

	get_random_cell_two_or_four (random_sequence: RANDOM): INTEGER
			-- Randomly returns two or four
		local
			random_value: INTEGER
		do
			random_value := (get_random (random_sequence, 2) + 1) * 2
			Result := random_value
		ensure
			Result = 2 or Result = 4
		end

	get_random_seed: INTEGER
			-- Returns a seed for random sequences
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

	get_random (random_sequence: RANDOM; ceil: INTEGER): INTEGER
			-- Returns a random integer  minor that ceil from a random sequence
		require
			ceil >= 0
		do
			random_sequence.forth
			Result := random_sequence.item \\ ceil;
		ensure
			Result < ceil
		end

feature {CONTROLLER_2048}

	set_random_free_cell
		local
			random_sequence: RANDOM
			random_cell_row: INTEGER
			random_cell_col: INTEGER
		do
				--initialize random seed
			create random_sequence.set_seed (get_random_seed)
			random_cell_row := get_random (random_sequence, 4) + 1;
			random_cell_col := get_random (random_sequence, 4) + 1;
			from
			until
				elements.item (random_cell_row, random_cell_col).is_available = True
			loop
					--generate a random position
				random_cell_row := get_random (random_sequence, 4) + 1;
				random_cell_col := get_random (random_sequence, 4) + 1;
			end
				-- set at cell random number
			set_cell (random_cell_row, random_cell_col, random_number_two_or_four (random_sequence))
			coord_last_random_cell := [random_cell_row, random_cell_col]
		end

	random_number_two_or_four (random_sequence: RANDOM): INTEGER
			-- Randomly returns two or four
		local
			random_number: INTEGER
		do
			random_number := (get_random (random_sequence, 2) + 1) * 2
			Result := random_number
		ensure
			Result = 2 or Result = 4
		end

	last_random_cell_coordinates: TUPLE [INTEGER, INTEGER]
			-- Returns the coordinates of the last randomly introduced cell
			-- Value should be (0,0) if no cell has been introduced in the last movement
			-- or if the game state is the initial state.
		do
			Result := coord_last_random_cell
		end

end
