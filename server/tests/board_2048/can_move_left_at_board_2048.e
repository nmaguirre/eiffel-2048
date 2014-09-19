note
	description: "Test class for routine can_move_left at BOARD_2048"
	author: "agusbauer"
	date: "August 30, 2014"
	revision: "0.01"

class
	CAN_MOVE_LEFT_AT_BOARD_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	can_move_left_test_empty_cell
		--Test when a cell has an empty cell to the left
		local
			board:BOARD_2048
		do
			create board.make_empty
			board.set_cell(2,2,2)
			board.set_cell(1,2,2) --just to maintain class invariant
			assert ("Can move left", board.can_move_left)
		end

	can_move_left_test_cell_with_same_value
		--Test when a cell has a cell to the left with the same value
		local
			board:BOARD_2048
		do
			create board.make_empty
			board.set_cell(2,2,4)
			board.set_cell(2,1,4)
			assert ("Can move left", board.can_move_left)
		end

	can_not_move_left_test
		--Test when a cell has a cell to the left with different value
		local
			board:BOARD_2048
		do
			create board.make_empty
			board.set_cell(2,2,4)
			board.set_cell(2,1,2)

			assert ("Can not move left", not board.can_move_left)
		end

	can_not_move_left_test_with_void_board
			-- Test when board is empty should raise an exception
		local
			res, ok, second_time: BOOLEAN
			board: BOARD_2048
		do
			if not second_time then
				ok := True
				res := board.can_move_left
				ok := False
			end
			assert ("Routine failed, as expected", ok)
		rescue
			second_time := True
			if ok then
				retry
			end
		end
end
