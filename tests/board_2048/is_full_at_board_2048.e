note
	description: "[
		Test for the is_full routine of class BOARD_2048.
	]"
	author: "Angelo Chaves"
	date: "August 28, 2014"
	revision: "0.01"
	testing: "type/manual"

class
	IS_FULL_AT_BOARD_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	is_full_with_full_board_test
			-- Test with a full board
		local
			board: BOARD_2048
			i,j: INTEGER
		do
			create board.make
			from 		-- Fill the board with cells
				j := 1
			until
				j = 4
			loop
				from
					i := 1
				until
					i = 4
				loop
					board.set_cell (i, j, 2)
					i := i + 1
				end
				j := j + 1
			end
			assert ("Board is full.", board.is_full)
		end

	is_full_with_empty_board_test
			-- Test with an empty board
		local
			board: BOARD_2048
		do
			create board.make_empty
			assert ("Board is not full.", not board.is_full)
		end

end


