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
		end

	make
			-- Creates a controller from scratch. The controller must create the
			-- classes that represent and take care of the logic of the game.
	
		do
			last_random_cell_coordinates := [0,0]
			create board.make

		ensure
			board /= Void
		end

feature -- Game State

	board: BOARD_2048
			-- Reference to the object that maintains the state of the game
			-- and takes care of the games logic.

	is_finished: BOOLEAN
			-- Indicates whether the game is finished or not.
			-- Game finishes when either 2048 is reached, or the entire board is filled.

	last_random_cell_coordinates: TUPLE[INTEGER,INTEGER]
			-- Returns the coordinates of th last randomly introduced
			-- cell. Value should be (0,0) if no cell has been introduced in the last movement
			-- or if the game state is the initial state.

feature -- Movement commands

	up
			-- Moves the cells to the uppermost possible point of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.
		local
			-- i, v, j: INTEGER
		do
				-- UPDATE NOT USING GET_VALUE, WHICH IS OBSOLETE
				--			from
				--				j := 1
				--			until
				--				j = 4
				--			loop
				--				from
				--					i := 4
				--				until
				--					i = 1
				--				loop
				--
				--					if board.elements.item (i, j).get_value /= 0 then
				--						if (i - 1 > 0) and (board.elements.item (i - 1, j).get_value /= 0) then
				--							if board.elements.item (i, j).get_value = board.elements.item (i - 1, j).get_value then
				--								v := board.elements.item (i, j).get_value + board.elements.item (i - 1, j).get_value
				--								board.set_cell (i - 1, j, v)
				--								i := i - 1
				--							end
				--						else
				--							if (i - 2 > 0) and (board.elements.item (i - 2, j).get_value /= 0) then
				--								if board.elements.item (i, j).get_value = board.elements.item (i - 2, j).get_value then
				--									v := board.elements.item (i, j).get_value + board.elements.item (i - 2, j).get_value
				--									board.set_cell (i - 2, j, v)
				--									i := i - 1
				--								else
				--									board.set_cell (i - 1, j, board.elements.item (i, j).get_value)
				--									i := i - 1
				--								end
				--							else
				--								if (i - 3 > 0) and (board.elements.item (i - 3, j).get_value /= 0) then
				--									if board.elements.item (i, j).get_value = board.elements.item (i - 3, j).get_value then
				--										v := board.elements.item (i, j).get_value + board.elements.item (i - 3, j).get_value
				--										board.set_cell (i - 3, j, v)
				--										i := i - 1
				--									else
				--										board.set_cell (i - 2, j, board.elements.item (i, j).get_value)
				--										i := i - 1
				--									end
				--								end
				--							end
				--						end
				--					end
				--				end --end from i
				--				j := j + 1
				--			end --end from j

				--			set_random_free_cell
		end --end do

	down
			-- Moves the cells to the bottom of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.
		do
		end

	left
			-- Moves the cells to the leftmost possible point of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.
		do
		end

	right
			-- Moves the cells to the leftmost possible point of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.
		do
		end

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
				--				end --end if
				--			end --end loop
		end --end do

end
