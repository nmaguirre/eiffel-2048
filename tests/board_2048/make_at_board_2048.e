note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	MAKE_AT_BOARD_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	make_at_board_2048
			-- New test routine
		local
			board: BOARD_2048
		do
			create board.make

			assert ("is not full",not board.is_full)
			assert ("is not winning",not board.is_winning_board)
			assert ("just two cells", board.nr_of_filled_cells = 2)
			assert ("4 columns", board.columns = 4)
			assert ("4 rows", board.rows = 4)
		end

end


