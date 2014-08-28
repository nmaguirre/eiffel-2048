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

	MAKE_AT_BOARD_2048
			-- New test routine
		local
			board: BOARD_2048
		do
			create board.make

			assert ("is not full",not board.is_full ())
			assert ("is not winning",not board.is_winning_board ())
		end

end


