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

	right
		obsolete
			"obsolete routine, should call right@BOARD_2048"
		do
			board.right
		end

feature {NONE} -- Auxiliary routines


end
