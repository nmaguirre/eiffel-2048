note
	description: "Tests for 'down' feature in CONTROLLER_2048."
	author: "Max Cejuela"
	date: "September 2, 2014"
	revision: "0.01"

class
	DOWN_AT_CONTROLLER_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	move_down_colapsing_cells_with_same_and_different_values
			--	        Scenario: Moving down changes board state colapsing cells with
			--                        similar and different values
			--                Given the game board is in state
			--                        |2 |8 |8 |0 |
			--                        |2 |8 |4 |0 |
			--                        |16|8 |4 |0 |
			--                        |16|4 |8 |0 |
			--                When I move down
			--                Then I should obtain
			--                        |0 |0 |0 |0 |
			--                        |0 |8 |8 |0 |
			--                        |4 |16|8 |0 |
			--                        |32|4 |8 |0 |
			--                And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make
			create controller.make_with_board (board)

			controller.board.set_cell (1, 1, 2)
			controller.board.set_cell (2, 1, 2)
			controller.board.set_cell (3, 1, 16)
			controller.board.set_cell (4, 1, 16)

			controller.board.set_cell (1, 2, 8)
			controller.board.set_cell (2, 2, 8)
			controller.board.set_cell (3, 2, 8)
			controller.board.set_cell (4, 2, 4)

			controller.board.set_cell (1, 3, 8)
			controller.board.set_cell (2, 3, 4)
			controller.board.set_cell (3, 3, 4)
			controller.board.set_cell (4, 3, 8)

			controller.down

			assert ("[3,1] has a 4", controller.board.elements.item(3,1).value=4)
			assert ("[4,1] has a 32", controller.board.elements.item(4,1).value=32)
			assert ("[2,2] has an 8", controller.board.elements.item(2,2).value=8)
			assert ("[3,2] has a 16", controller.board.elements.item(3,2).value=16)
			assert ("[4,2] has a 4", controller.board.elements.item(4,2).value=4)
			assert ("[2,3] has an 8", controller.board.elements.item(2,3).value=8)
			assert ("[3,3] has an 8", controller.board.elements.item(3,3).value=8)
			assert ("[4,3] has an 8", controller.board.elements.item(4,3).value=8)
			-- assert ("board has 9 filled cells", controller.board.nr_of_filled_cells=9) set_random_free_cell is not implemented
		end

	move_down_colapsing_cells_with_different_values
			--	        Scenario: Moving down only moves cells with different values to the lowermost possible empty cell
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |2 |
			--                        |  |  |  |4 |
			--                        |  |  |  |  |
			--                When I move down
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |2 |
			--                        |  |  |  |4 |
			--				  And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			create controller.make_with_board(board)

			controller.board.set_cell (2, 4, 2)
			controller.board.set_cell (3, 4, 4)

			controller.down

			assert ("[3,4] has a 2", controller.board.elements.item(3,4).value=2)
			assert ("[4,4] has a 4", controller.board.elements.item(4,4).value=4)
			-- assert ("board has 3 filled cells", controller.board.nr_of_filled_cells=3) set_random_free_cell is not implemented
		end

	move_down_colapsing_cells_with_same_values
			--	        Scenario: Moving down only combines cells with equal values to the lowermost possible empty cell
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |2 |
			--                        |  |  |  |2 |
			--                When I move down
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |4 |
			--				  And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			create controller.make_with_board(board)

			controller.board.set_cell (3, 4, 2)
			controller.board.set_cell (4, 4, 2)

			controller.down

			assert ("[4,4] has a 4", controller.board.elements.item(4,4).value=4)
			-- assert ("board has 2 filled cells", controller.board.nr_of_filled_cells=2) set_random_free_cell is not implemented
		end

	move_down_movement_of_cells
			--	        Scenario: Moving down changes board state moving all cells to the lowermost
			--                        empty cell
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |2 |  |  |  |
			--                        |  |2 |  |  |
			--                        |  |  |  |  |
			--                When I move down
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |2 |2 |  |  |
			--                And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			create controller.make_with_board(board)

			board.set_cell(2,1,2)
			board.set_cell(3,2,2)

			controller.down

			assert ("[4,1] has a 2", controller.board.elements[4,1].value=2)
			assert ("[4,2] has a 2", controller.board.elements[4,2].value=2)
			-- assert ("board has 3 filled cells", controller.board.nr_of_filled_cells=3) set_random_free_cell is not implemented
		end

	move_down_error
			--	        Scenario: Moving down throws an error due to violation of the pre condition
			--					"Must be able to move down"
			--                Given the game board is in state
			--                        |32 |16 |32 |16 |
			--                        |128|64 |128|64 |
			--                        |16 |32 |16 |32 |
			--                        |64 |128|64 |128|
			--                When I move down I should obtain an error
		local
			controller: CONTROLLER_2048
			board: BOARD_2048
			failed, second_time: BOOLEAN
		do
			if not second_time then
          		failed := True
				create board.make
				create controller.make_with_board(board)
				controller.board.set_cell(1, 1, 32)
				controller.board.set_cell(2, 1, 128)
				controller.board.set_cell(3, 1, 16)
				controller.board.set_cell(4, 1, 64)
				controller.board.set_cell(1, 2, 16)
				controller.board.set_cell(2, 2, 64)
				controller.board.set_cell(3, 2, 32)
				controller.board.set_cell(4, 2, 128)
				controller.board.set_cell(1, 3, 32)
				controller.board.set_cell(2, 3, 128)
				controller.board.set_cell(3, 3, 16)
				controller.board.set_cell(4, 3, 64)
				controller.board.set_cell(1, 4, 16)
				controller.board.set_cell(2, 4, 64)
				controller.board.set_cell(3, 4, 32)
				controller.board.set_cell(4, 4, 128)
				controller.down -- Must throw an exception
				failed := False
			end
    		assert ("The rutine has to fail", failed)
			rescue
     			second_time := True
     			if failed then   -- failed = true means that the rutine failed
           			retry
    			end
		end --end do
end
