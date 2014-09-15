note
	description: "Test class for method is_finished of class controller_2048."
	author: "bisoardi"
	date: "September 3, 2014"
	revision: "$0.01"

class
	IS_FINISHED_AT_CONTROLLER_2048

inherit

	EQA_TEST_SET

feature

	is_finished_on_starting_board
	-- Checks the finish condition on the starting board

		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make
			create controller.make_with_board (board)
			assert ("is_finished should be False", not controller.is_finished)
		end

	is_finished_on_full_board
	-- Checks the finish condition on full board, without a cell with 2048 on it

		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (1, 1, 2)
			board.set_cell (1, 2, 4)
			board.set_cell (1, 3, 2)
			board.set_cell (1, 4, 4)
			board.set_cell (2, 1, 4)
			board.set_cell (2, 2, 2)
			board.set_cell (2, 3, 4)
			board.set_cell (2, 4, 2)
			board.set_cell (3, 1, 2)
			board.set_cell (3, 2, 4)
			board.set_cell (3, 3, 2)
			board.set_cell (3, 4, 4)
			board.set_cell (4, 1, 4)
			board.set_cell (4, 2, 2)
			board.set_cell (4, 3, 4)
			board.set_cell (4, 4, 2)
			create controller.make_with_board (board)
			assert ("is_finished should be True", controller.is_finished)
		end

		is_finished_on_board_with_2048
		-- Checks the finish condition on a board with a 2048 on it

			local
				board: BOARD_2048
				controller: CONTROLLER_2048
			do
				create board.make_empty
				board.set_cell (3, 2, 2048)
				create controller.make_with_board (board)
				assert ("is_finished should be True", controller.is_finished)
			end

end
