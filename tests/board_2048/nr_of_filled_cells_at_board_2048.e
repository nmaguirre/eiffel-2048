note
	description: "Summary description for {NR_OF_FILLED_CELLS_AT_BOARD_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NR_OF_FILLED_CELLS_AT_BOARD_2048

inherit

	EQA_TEST_SET

feature

	nr_of_filled_cells_on_empty_board -- Checks the counting of filled cells on an empty board

		local
			board: BOARD_2048
		do
			create board.make_empty
			assert ("The number of filled cells should be 0", board.nr_of_filled_cells = 0)
		end

	nr_of_filled_cells_on_starting_board -- Checks the counting of filled cells on the starting board

		local
			board: BOARD_2048
		do
			create board.make
			assert ("The number of filled cells should be 2", board.nr_of_filled_cells = 2)
		end

end
