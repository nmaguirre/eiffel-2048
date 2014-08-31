note
	description: "This class takes care of the control of the game."
	author: ""
	date: "August 25, 2014"
	revision: "0.01"

class
	CONTROLLER_2048

create
	make, make_with_board

feature -- Initialisation

	make_with_board (new_board: BOARD_2048)
			-- Creates a controller with reference to a provided board
		require
			new_board /= Void
		do
			board := new_board
		ensure
			board = new_board
		end

	make
			-- Creates a controller from scratch. The controller must create the
			-- classes that represent and take care of the logic of the game.

		do
			coord_last_random_cell := [0, 0]
			create board.make
		ensure
			board /= Void
		end

feature {ANY}

	coord_last_random_cell: TUPLE [INTEGER, INTEGER]
			-- Tuple containing the coordinates of the last random cell.

feature -- Game State

	board: BOARD_2048
			-- Reference to the object that maintains the state of the game
			-- and takes care of the games logic.

	is_finished: BOOLEAN
			-- Indicates whether the game is finished or not.
			-- Game finishes when either 2048 is reached, or if any movement is possible.
		local
			finished: BOOLEAN -- Auxiliary variable to capture the finalization desicion
		do
			finished := False
			if not board.can_move_up and not board.can_move_down and not board.can_move_left and not board.can_move_right then
				Result := True
			else
				finished := board.is_winning_board
			end
			Result := finished
		end

	last_random_cell_coordinates: TUPLE [INTEGER, INTEGER]
			-- Returns the coordinates of th last randomly introduced
			-- cell. Value should be (0,0) if no cell has been introduced in the last movement
			-- or if the game state is the initial state.
		do
			Result := coord_last_random_cell
		end

feature -- Movement commands

	up
			-- Moves the cells to the uppermost possible point of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.
		require
			board.can_move_up
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
					if board.elements.item (i, j).value /= 0 then
						k := i + 1;
						from
								-- search for the next element /= 0
						until
							(k > 4) or (board.elements.item (k, j).value /= 0)
						loop
							k := k + 1;
						end
						if (k <= 4) then
							if (board.elements.item (i, j) .value = board.elements.item (k, j).value) then
								board.set_cell (i, j, (board.elements.item (k, j).value + board.elements.item (i, j).value))
								board.set_cell (k, j, 0)
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
					if board.elements.item (i, j).value = 0 then
						k := i + 1;
						from
								-- search for the next element /= 0
						until
							(k > 4) or (board.elements.item (k, j).value /= 0)
						loop
							k := k + 1;
						end
						if (k <= 4) then
							board.set_cell (i, j, board.elements.item (k, j).value)
							board.set_cell (k, j, 0)
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

	down --Command that moves the cells to the lowermost possible point of the game board
		 require
			board.can_move_down
		local
			i ,j ,aux : INTEGER
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
					if board.elements.item (i, j).value /= 0 then
						aux := j
						j := j-1
						from
							-- search for the next element /= 0
						until (j<1) and (board.elements.item (i, j) /= 0)
						loop
							j := j-1
						end
						if j>=1 then -- if search is succesful
							if board.elements.item (i, aux).value = board.elements.item (i, j).value  then
								board.set_cell (i, aux, (board.elements.item (i, aux).value + board.elements.item (i, j).value))
								board.set_cell (i, j, 0)
								j := j-1
							end
						end
					else
						j := j-1
					end -- end if /=0
				end -- end loop j
				i := i + 1
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
					if ((board.elements.item (i, j).value = 0) and (board.elements.item (i, j-1).value) /= 0) then -- if i,j = 0 and the one above it is =/ 0
						 board.set_cell(i, j, board.elements.item (i, j-1).value)
						 board.set_cell(i, j-1, 0)
						 if (j < 4) then --if not at the lowermost cell
						 	j := j+1 -- continues moving downward until it reaches an ocupied cell
						 else
						 	j := j-1 -- continues moving upward
						 end
					else
						j := j-1
					end
				end -- end loop j
			end -- end loop i
			set_random_free_cell
		--ensure
			--TODO
		end -- end do

	left
			-- Moves the cells to the leftmost possible point of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.
		do
		end

	right
			-- Moves the cells to the rightmost possible point of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.

		local
			i, j, k: INTEGER
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
					if board.elements.item(i, j).value /= 0 then
					   if j > 1 then
					   	  k := j - 1
					      from
					      until
					        (k <= 1) or (board.elements.item(i, k).value /= 0)
					 	  loop
						  	 k := k - 1
						  end
						  if (k >= 1) then
						  	 if (board.elements.item(i, j).value = board.elements.item(i, k).value) then
							 	 board.set_cell(i, j, (board.elements.item(i, k).value + board.elements.item(i, j).value))
								 board.set_cell(i, k, 0)
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
					j := 1
				until
					j > 4
				loop
				    if board.elements.item(i, j).value /= 0 then
				       position_right(i, board.elements.item (i, j).value)
						j := j + 1;
					else
                        j := j + 1
                    end --end if
                end --end loop j
			end --end loop i
			set_random_free_cell
		end --end do

feature {NONE} -- Auxiliary routines

	set_random_free_cell
			-- Sets an unset cell of the board with value 2 or 4
			-- Position of unset cell is chosen randomly.
			-- Value to set the cell (2 or 4) chosen randomly.
		local
			--			marca_zero: BOOLEAN
			--			tx, ty: INTEGER
			--			positionx: RANDOM
			--			positiony: RANDOM
		do
				-- SEE THE COMMENT. METHOD DOES NOT DO WHAT IS SUPPOSED TO
				--			from
				--				marca_zero := False
				--			until
				--				marca_zero = True
				--			loop
				--				tx := positionx.next_random (3)
				--				tx := tx + 1
				--				ty := positiony.next_random (3)
				--				tx := ty + 1
				--				if board.elements.item (tx, ty).is_available then
				--					board.elements.item (tx, ty).set_value (2)
				--					marca_zero := True
				--					coord_last_random_cell = [tx, ty]
				--				end --end if
				--			end --end loop
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
				if board.elements.item(row, column).value = 0 then
					board.set_cell(row, column, val)
					column := 0
				else
					column := column - 1
				end --end if
			end --end loop
		end --end do

end
