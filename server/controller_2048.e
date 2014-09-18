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
			-- Game finishes when either 2048 is reached, or if there is no possible movement.
		local
			finished: BOOLEAN -- Auxiliary variable to capture the finalization desicion
		do
			finished := False
			if not board.can_move_up and not board.can_move_down and not board.can_move_left and not board.can_move_right then
				finished := True
			else
				finished := board.is_winning_board
			end
			Result := finished
		end


feature -- Movement commands

	down
		obsolete
			"obsolete routine, should call down@BOARD_2048"
		do
			board.down
		end

	left
		obsolete
			"obsolete routine, should call left@BOARD_2048"
		do
			board.left
		end

	right
			-- Moves the cells to the rightmost possible point of the game board.
			-- Movement colapses cells with the same value.
			-- It adds one more random cell with value 2 or 4, after the movement.

		require
			board.can_move_right
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
					if board.elements.item (i, j).value /= 0 then
						if j > 1 then
							k := j - 1
							from
							until
								(k <= 1) or (board.elements.item (i, k).value /= 0)
							loop
								k := k - 1
							end
							if (k >= 1) then
								if (board.elements.item (i, j).value = board.elements.item (i, k).value) then
									board.set_cell (i, j, (board.elements.item (i, k).value + board.elements.item (i, j).value))
									board.set_cell (i, k, 0)
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
					if board.elements.item (i, j).value /= 0 then
						v := board.elements.item (i, j).value
						board.set_cell (i, j, 0)
						position_right (i, v)
						j := j - 1;
					else
						j := j - 1
					end --end if
				end --end loop j
				i := i + 1
			end --end loop i
			board.set_random_free_cell
		end --end do

feature {NONE} -- Auxiliary routines

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
				if board.elements.item (row, column).value = 0 then
					board.set_cell (row, column, val)
					column := 0
				else
					column := column - 1
				end --end if
			end --end loop
		end --end do

end
