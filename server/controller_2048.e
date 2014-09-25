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

feature -- Movement commands

	right
		obsolete
			"obsolete routine, should call right@BOARD_2048"
		do
			board.right
		end

feature {NONE} -- Auxiliary routines


end
