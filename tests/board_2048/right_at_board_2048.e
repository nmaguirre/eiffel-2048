note
	description: "Summary description for {RIGHT_AT_BOARD_2048}."
	author: "ngomez"
	date: "September 1, 2014"
	revision: "0.01"

class
	RIGHT_AT_BOARD_2048

inherit

	EQA_TEST_SET

feature --Test routines

	test_moves_right
			--	        Scenario: Moving RIGHT changes board state colapsing crashing cells with
			--                        similar values
			--                Given the game board is in state
			--                        |2 |2 |2 |4 |
			--                        |4 |  |4 |2 |
			--                        |2 |  |  |  |
			--                        |  |  |  |  |
			--                When I move RIGHT
			--                Then I should obtain
			--                        |  |2 |4 |4 |
			--                        |  |  |8 |2 |
			--                        |  |  |  |2 |
			--                        |  |  |  |  |
			--                And one of the empty cells remaining filled with 2 or 4.

		local
			board: BOARD_2048
		do
			create board.make_empty
			board.set_cell (1, 1, 2)
			board.set_cell (1, 2, 2)
			board.set_cell (1, 3, 2)
			board.set_cell (1, 4, 4)
			board.set_cell (2, 1, 4)
			board.set_cell (2, 3, 4)
			board.set_cell (2, 4, 2)
			board.set_cell (3, 1, 2)
			board.right
			assert ("First row moved right correctly", board.elements.item (1, 2).value = 2 and board.elements.item (1, 3).value = 4 and board.elements.item (1, 4).value = 4)
			assert ("Second row moved right correctly", board.elements.item (2, 3).value = 8 and board.elements.item (2, 4).value = 2)
			assert ("Third row moved right correctly", board.elements.item (3, 4).value = 2)
		end --end do

	test_moves_right_cell_value_is_valid
			--	        Scenario: Moving RIGHT changes board state colapsing crashing cells with
			--                        similar values
			--                Given the game board is in state
			--                        |   |16 |   |16 |
			--                        |32 |   |32 |   |
			--                        |   |64 |64 |   |
			--                        |128|   |   |128|
			--                When I move RIGHT
			--                Then I should obtain
			--                        |   |   |   |32 |
			--                        |   |   |   |64 |
			--                        |   |   |   |128|
			--                        |   |   |   |256|
			--                And one of the empty cells remaining filled with 2 or 4.
			--                In the test, it checks all of the cell values ​​that are different from zero,
			--                are power of two. This ensures that the cells collapse,
			--                the conditions that they must meet to be lost.

		local
			board: BOARD_2048
			i, j, count_incorrect: INTEGER
		do
			create board.make_empty
			board.set_cell (1, 2, 16)
			board.set_cell (1, 4, 16)
			board.set_cell (2, 1, 32)
			board.set_cell (2, 3, 32)
			board.set_cell (3, 2, 64)
			board.set_cell (3, 3, 64)
			board.set_cell (4, 1, 128)
			board.set_cell (4, 4, 128)
			board.right
			count_incorrect := 0
			from
				i := 1
			until
				i = 4
			loop
				from
					j := 1
				until
					j = 4
				loop
					if board.elements.item (i, j).value /= 0 then
						if not board.elements.item (i, j).is_valid_value (board.elements.item (i, j).value) then
							count_incorrect := count_incorrect + 1
						else
							j := j + 1
						end
					else
						j := j + 1
					end
				end -- end loop j
				i := i + 1
			end --end loop i
			if count_incorrect > 0 then
				assert ("All cells have valid values", False)
			else
				assert ("All cells have valid values", True)
			end
		end --end do

	test_right_with_cant_move_right

			--	        Scenario: can't move RIGHT, pre condition is violated.
			--                    Given the game board is in state
			--              When I move RIGHT the funtion throw an error.
			--                        |32 |16 |32 |16 |
			--                        |128|64 |128|64 |
			--                        |16 |32 |16 |32 |
			--                        |64 |128|64 |128|

		local
			board: BOARD_2048
			ok, second_time: BOOLEAN
		do
			if not second_time then
				ok := True
				create board.make
				board.set_cell (1, 1, 32)
				board.set_cell (2, 1, 128)
				board.set_cell (3, 1, 16)
				board.set_cell (4, 1, 64)
				board.set_cell (1, 2, 16)
				board.set_cell (2, 2, 64)
				board.set_cell (3, 2, 32)
				board.set_cell (4, 2, 128)
				board.set_cell (1, 3, 32)
				board.set_cell (2, 3, 128)
				board.set_cell (3, 3, 16)
				board.set_cell (4, 3, 64)
				board.set_cell (1, 4, 16)
				board.set_cell (2, 4, 64)
				board.set_cell (3, 4, 32)
				board.set_cell (4, 4, 128)
				board.right -- Must throw an exception
				ok := False
			end
			assert ("The rutine has to fail", ok)
		rescue
			second_time := True
			if ok then -- ok = true means that the rutine failed
				retry
			end
		end --end do

	test_move_right_movement_of_cells

			--	        Scenario: Moving RIGHT changes board state moving all cells to the rightmost empty cell.
			--                    Given the game board is in state
			--                    When i move RIGHT,
			--                        |   |   |   |2  |
			--                        |   |   |4  |   |
			--                        |   |8  |   |   |
			--                        |16 |   |   |   |
			--                    Then I should obtain
			--                        |   |   |   | 2 |
			--                        |   |   |   | 4 |
			--                        |   |   |   | 8 |
			--                        |   |   |   |16 |
			--                    And one of the empty cells remaining filled with 2 or 4.

		local
			board: BOARD_2048
		do
			create board.make_empty
			board.set_cell (1, 4, 2)
			board.set_cell (2, 3, 4)
			board.set_cell (3, 2, 8)
			board.set_cell (4, 1, 16)
			board.right
			assert ("First row moved right correctly", board.elements.item (1, 4).value = 2)
			assert ("Second row moved right correctly", board.elements.item (2, 4).value = 4)
			assert ("Third row moved right correctly", board.elements.item (3, 4).value = 8)
			assert ("Fourth row moved right correctly", board.elements.item (4, 4).value = 16)
		end --end do

	test_move_right_not_movement_of_cells

			--	        Scenario: Moving RIGHT don't changes board state.
			--                    Given the game board is in state
			--                    When i move RIGHT,
			--                        |   |   |   | 2 |
			--                        |   |   |   | 2 |
			--                        |   |   |   | 2 |
			--                        |   |   |   | 2 |
			--                    Then I should obtain the same board
			--                        |   |   |   | 2 |
			--                        |   |   |   | 2 |
			--                        |   |   |   | 2 |
			--                        |   |   |   | 2 |
			--                    And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			ok, second_time: BOOLEAN
		do
			if not second_time then
				ok := True
				create board.make_empty
				board.set_cell (1, 4, 2)
				board.set_cell (2, 4, 2)
				board.set_cell (3, 4, 2)
				board.set_cell (4, 4, 2)
				board.right -- Must throw an exception
				ok := False
			end
			assert ("The routine RIGHT has to fail", ok)
		rescue
			second_time := True
			if ok then -- ok = true means that the rutine failed
				retry
			end
		end --end do

end
