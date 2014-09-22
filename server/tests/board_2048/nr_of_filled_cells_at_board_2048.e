note
	description: "[
		Tests for the nr_of_filled_cells routine at class BOARD_2048.
	]"
	author: "Angelo Chaves"
	date: "August 31, 2014"
	revision: "0.01"
	testing: "type/manual"

class
	NR_OF_FILLED_CELLS_AT_BOARD_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	nr_of_filled_cells_with_standard_board_test
			-- Test with a initialised board
		local
			board: BOARD_2048
		do
			create board.make
			assert ("Initialised board has two cells ", board.nr_of_filled_cells = 2)
		end

	nr_of_filled_cells_with_empty_board_test
			-- Test with an empty board
		local
			board: BOARD_2048
		do
			create board.make_empty
			assert ("Empty board has zero cells ", board.nr_of_filled_cells = 0)
		end

	nr_of_filled_cells_with_void_board
			-- Test with a not initialised board
		local
			ok, second_time: BOOLEAN
			filled_cells: INTEGER
			board: BOARD_2048
		do
			if not second_time then
				ok := True
				filled_cells := board.nr_of_filled_cells
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


