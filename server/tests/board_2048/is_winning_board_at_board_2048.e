note
	description: "[
		Tests for the method is_winning_board of class BOARD_2048
	]"
	author: "facumolina"
	date: "$August 28, 2014$"
	revision: "$0.01$"
	testing: "type/manual"

class
	IS_WINNING_BOARD_AT_BOARD_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	is_winning_board_on_initial_board_test
			-- Test for empty board
		local
			board : BOARD_2048
		do
			create board.make
			assert ("An empty board is not a winning board", not board.is_winning_board)
		end

	is_winning_board_on_simple_board
			-- Test for simple board that not is a winning board
			--                        | 4| 8|  |  |
			--                        | 2|  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
		local
			board : BOARD_2048
		do
			create board.make_empty
			board.set_cell (1,1,4)
			board.set_cell (1,2,8)
			board.set_cell (2,1,2)
			assert ("The board is not a winning board", not board.is_winning_board)
		end

	is_winning_board_on_winning_board
			-- Test for board that is a winning board
			--                        |    |    |    |    |
			--                        |    |    |    |    |
			--                        |    |    |    |   4|
			--                        |  32| 256|1024|2048|
		local
			board : BOARD_2048
		do
			create board.make_empty
			board.set_cell (3,4,4)
			board.set_cell (4,1,32)
			board.set_cell (4,2,256)
			board.set_cell (4,3,1024)
			board.set_cell (4,4,2048)
			assert ("The board is a winning board", board.is_winning_board)
		end

end


