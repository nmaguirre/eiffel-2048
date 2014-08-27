note
	description: "[
		Tests for the method is_winning_board of class BOARD_2048
	]"
	author: "facumolina"
	date: "$August 26, 2014$"
	revision: "$0.01$"
	testing: "type/manual"

class
	IS_WINNING_BOARD_AT_BOARD_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	is_winning_board_on_empty_board_test
			-- Test for empty board
		local
			board : BOARD_2048
		do
			create board.make_empty
			assert ("An empty board is not a winning board", not board.is_winning_board)
		end

end


