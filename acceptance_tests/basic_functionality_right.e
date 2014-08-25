note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BASIC_FUNCTIONALITY_RIGHT

inherit

	EQA_TEST_SET

feature -- Test routines

	move_right_colapsing_cells
			-- Scenario: Moving right changes board state colapsing crashing cells with
			-- 				similar values
			-- 		Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |2 |2 |
			-- 		When I move right
			-- 		And the randomly picked coordinate for the new cell is (x,y)
			-- 		Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |4 |
			-- 		And (x,y) must be different from (4,4)
			-- 		And the board in position (x,y) should be filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (4, 3, 2)
			board.set_cell (4, 4, 2)
			create controller.make_with_board (board)
			controller.right
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("corner has a four", controller.board.elements [4, 4].value = 4)
					assert ("board has two filled cells", controller.board.nr_of_filled_cells = 2)
					assert ("coordinates of new cell is not (4,4)", row_new /= 4 or col_new /= 4)
					assert ("new cell has a 2 or a 4", controller.board.elements [row_new, col_new].value = 2 or controller.board.elements [row_new, col_new].value = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

	move_right_without_colapsing_cells
			-- Scenario: Moving right changes board state without crashing cells with
			-- 				similar values
			-- 		Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |2 |  |  |  |
			--                        |  |  |  |2 |
			-- 		When I move right
			-- 		And the randomly picked coordinate for the new cell is (x,y)
			-- 		Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |2 |
			--                        |  |  |  |2 |
			-- 		And (x,y) must be different from (4,4) and (3,4)
			-- 		And the board in position (x,y) should be filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (3, 1, 2)
			board.set_cell (4, 4, 2)
			create controller.make_with_board (board)
			controller.right
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("corner has a 2", controller.board.elements [4, 4].value = 2)
					assert ("(3,4) has a 2", controller.board.elements [3, 4].value = 2)
					assert ("board has three filled cells", controller.board.nr_of_filled_cells = 3)
					assert ("coordinates of new cell is not (4,4)", row_new /= 4 or col_new /= 4)
					assert ("coordinates of new cell is not (3,4)", row_new /= 3 or col_new /= 4)
					assert ("new cell has a 2 or a 4", controller.board.elements [row_new, col_new].value = 2 or controller.board.elements [row_new, col_new].value = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

	move_right_with_colapsing_cells_and_residual
			-- Scenario: Moving right changes board state with crashing cells with
			-- 				similar values leaving residual matching cells
			-- 		Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |2 |2 |2 |
			-- 		When I move right
			-- 		And the randomly picked coordinate for the new cell is (x,y)
			-- 		Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |2 |4 |
			-- 		And (x,y) must be different from (4,4) and (4,3)
			--		And the board in position (x,y) should be filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (4, 2, 2)
			board.set_cell (4, 3, 2)
			board.set_cell (4, 4, 2)
			create controller.make_with_board (board)
			controller.right
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("corner has a 4", controller.board.elements [4, 4].value = 4)
					assert ("(4,3) has a 2", controller.board.elements [3, 4].value = 2)
					assert ("board has three filled cells", controller.board.nr_of_filled_cells = 3)
					assert ("coordinates of new cell is not (4,4)", row_new /= 4 or col_new /= 4)
					assert ("coordinates of new cell is not (4,3)", row_new /= 4 or col_new /= 3)
					assert ("new cell has a 2 or a 4", controller.board.elements [row_new, col_new].value = 2 or controller.board.elements [row_new, col_new].value = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

end
