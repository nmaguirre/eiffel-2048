note
	description: "[
		Test of the make_with_board constructor in class CONTROLLER_2048.
	]"
	author: "Angelo Chaves"
	date: "2014-08-26"
	revision: "0.1"
	testing: "type/manual"

class
	MAKE_WITH_BOARD_AT_CONTROLLER_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	make_with_board_with_default_board_test
			-- Test with an empty board
		local
			controller: CONTROLLER_2048
			board: BOARD_2048
		do
			create board.make
			create controller.make_with_board (board)
			assert ("The board of the controller is effectively set", controller.board = board)
		end

end


