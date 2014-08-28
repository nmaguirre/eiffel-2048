note
	description: "Test class for routine can_move_up of the BOARD_2048 class"
	author: "Matias-Bernal"
	date: "28/08/2014"
	revision: "1.1"

class
	CAN_MOVE_UP_AT_BOARD_2048

inherit

	EQA_TEST_SET

feature -- Positive Tests

	can_move_up_test_with_empty_board
			-- Test this method with the empty board
			-- This test should return True
		local
			board: BOARD_2048
		do
			create board.make_empty
			assert ("You can move up, this test should return true", board.can_move_up)
		end

	can_move_up_test_with_full_board_and_no_have_moves
			-- Test this method with full board and differents values in the rows
			-- This test should return False
		local
			board: BOARD_2048
			i,j,k: INTEGER
		do
			create board.make_empty
			from
				j := 1
			until
				j >= board.columns-1
				loop
					k := 2
					from
						i := board.rows-1
					until
						i <= 1
					loop
						board.set_cell (i, j, k)
						i := i - 1
						k := k*2
					end
					j := j + 1
				end
			assert ("You can't move up, the board is full.", not board.can_move_up)
		end

		can_move_up_test_with_full_board_and_have_moves
				-- Test this method with full board and same values in the rows
				-- This test should return True
			local
				board: BOARD_2048
				i,j: INTEGER
			do
				create board.make_empty
				from
					j := 0
				until
					j >= board.columns
					loop
						from
							i := board.rows-1
						until
							i <= 0
						loop
							board.set_cell (i, j, 2)
							i := i - 1
						end
						j := j + 1
					end
				assert ("You can move up, even if the board is full.", board.can_move_up)
			end

		can_move_up_test_with_all_cells_up_in_the_board
				-- Test this method with all cells up in the board
				-- This test should return False
			local
				board: BOARD_2048
				i,j,k: INTEGER
			do
				create board.make_empty
				from
					j := 0
				until
					j >= board.columns
					loop
						k := 2
						from
							i := board.rows-2
						until
							i <= 0
						loop
							board.set_cell (i, j, k)
							i := i - 1
							k := k*2
						end
						j := j + 1
					end
				assert ("You can't move up, all cells is up.", not board.can_move_up)
			end

feature -- Negative Tests


	can_move_up_test_with_void_board
			-- Test this method with the void board should raise an exception
			-- This test should return True
		local
			res, ok, second_time: BOOLEAN
			board: BOARD_2048
		do
			if not second_time then
				ok := True
				create board.make
				res := board.can_move_up
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
