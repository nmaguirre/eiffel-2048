note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BASIC_FUNCTIONALITY_UP

inherit

	EQA_TEST_SET

feature -- Test routines

	move_up_colapsing_cells
--        Scenario: Moving up changes board state colapsing crashing cells with
--                        similar values
--                Given the game board is in state
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |  |  |2 |  |
--                        |  |  |2 |  |
--                When I move up
--                And the randomly picked coordinate for the new cell is (x,y)
--                Then I should obtain
--                        |  |  |4 |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                And (x,y) must be different from (1,3)
--                And the board in position (x,y) should be filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (3, 3, 2)
			board.set_cell (4, 3, 2)
			create controller.make_with_board (board)
			assert ("can move up!", controller.board.can_move_up)
				-- moving up
			controller.up
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("(1,3) has a 4", controller.board.elements [4, 3].value = 4)
					assert ("board has two filled cells", controller.board.nr_of_filled_cells = 2)
					assert ("coordinates of new cell is not (1,3)", row_new /= 1 or col_new /= 3)
					assert ("new cell has a 2 or a 4", controller.board.elements [row_new, col_new].value = 2 or controller.board.elements [row_new, col_new].value = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

	move_up_without_colapsing_cells
--        Scenario: Moving up changes board state without crashing cells with
--                        similar values
--                Given the game board is in state
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |2 |  |  |  |
--                        |  |  |  |2 |
--                When I move up
--                And the randomly picked coordinate for the new cell is (x,y)
--                Then I should obtain
--                        |2 |  |  |2 |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                And (x,y) must be different from (1,1) and (1,4)
--                And the board in position (x,y) should be filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (3, 1, 2)
			board.set_cell (4, 4, 2)
			create controller.make_with_board (board)
			controller.up
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("corner has a 2", controller.board.elements [1, 4].value = 2)
					assert ("(4,1) has a 2", controller.board.elements [1, 1].value = 2)
					assert ("board has three filled cells", controller.board.nr_of_filled_cells = 3)
					assert ("coordinates of new cell is not (1,4)", row_new /= 1 or col_new /= 4)
					assert ("coordinates of new cell is not (1,1)", row_new /= 1 or col_new /= 1)
					assert ("new cell has a 2 or a 4", controller.board.elements [row_new, col_new].value = 2 or controller.board.elements [row_new, col_new].value = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

	move_up_with_colapsing_cells_and_residual
--        Scenario: Moving up changes board state with crashing cells with
--                        similar values leaving residual matching cells
--                Given the game board is in state
--                        |  |  |  |  |
--                        |  |  |  |2 |
--                        |  |  |  |2 |
--                        |  |  |  |2 |
--                When I move up
--                And the randomly picked coordinate for the new cell is (x,y)
--                Then I should obtain
--                        |  |  |  |4 |
--                        |  |  |  |2 |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                And (x,y) must be different from (1,4) and (2,4)
--                And the board in position (x,y) should be filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (2, 4, 2)
			board.set_cell (3, 4, 2)
			board.set_cell (4, 4, 2)
			create controller.make_with_board (board)
			controller.up
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("corner has a 4", controller.board.elements [1, 4].value = 4)
					assert ("(3,4) has a 2", controller.board.elements [2, 4].value = 2)
					assert ("board has three filled cells", controller.board.nr_of_filled_cells = 3)
					assert ("coordinates of new cell is not (1,4)", row_new /= 1 or col_new /= 4)
					assert ("coordinates of new cell is not (2,4)", row_new /= 2 or col_new /= 4)
					assert ("new cell has a 2 or a 4", controller.board.elements [row_new, col_new].value = 2 or controller.board.elements [row_new, col_new].value = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

	move_up_with_colapsing_cells_and_residual_tail
--       Scenario: Moving up changes board state with crashing cells with
--                        similar values leaving other residual matching cells
--                Given the game board is in state
--                        |  |  |  |  |
--                        |  |  |  |4 |
--                        |  |  |  |2 |
--                        |  |  |  |2 |
--                When I move up
--                And the randomly picked coordinate for the new cell is (x,y)
--                Then I should obtain
--                        |  |  |  |4 |
--                        |  |  |  |4 |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                And (x,y) must be different from (1,4) and (2,4)
--                And the board in position (x,y) should be filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (2, 4, 4)
			board.set_cell (3, 4, 2)
			board.set_cell (4, 4, 2)
			create controller.make_with_board (board)
			controller.up
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("corner has a 4", controller.board.elements [1, 4].value = 4)
					assert ("(2,4) has a 4", controller.board.elements [2, 4].value = 4)
					assert ("board has three filled cells", controller.board.nr_of_filled_cells = 3)
					assert ("coordinates of new cell is not (1,4)", row_new /= 1 or col_new /= 4)
					assert ("coordinates of new cell is not (2,4)", row_new /= 2 or col_new /= 4)
					assert ("new cell has a 2 or a 4", controller.board.elements [row_new, col_new].value = 2 or controller.board.elements [row_new, col_new].value = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

	move_up_not_changing_board
--       Scenario: Moving up does not change the board
--                Given the game board is in state
--                        |  |8 |4 |2 |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                When I move up
--                Then I should obtain exactly
--                        |  |8 |4 |2 |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (1, 2, 8)
			board.set_cell (1, 3, 4)
			board.set_cell (1, 4, 2)
			create controller.make_with_board (board)
			controller.up
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("corner has a 2", controller.board.elements [1, 4].value = 2)
					assert ("(1,3) has a 4", controller.board.elements [1, 3].value = 4)
					assert ("(1,2) has an 8", controller.board.elements [1, 2].value = 8)
					assert ("board has three filled cells", controller.board.nr_of_filled_cells = 3)
					assert ("coordinates of new cell is (0,0), no new cell", row_new /= 0 or col_new /= 0)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

	move_up_makes_you_win
--        Scenario: Moving up makes you win
--                Given the game board is in state
--                        |  |  |  |     |
--                        |  |  |  |     |
--                        |  |  |  |1024 |
--                        |  |  |  |1024 |
--                When I move up
--                Then I should obtain exactly
--                        |  |  |  |2048 |
--                        |  |  |  |     |
--                        |  |  |  |     |
--                        |  |  |  |     |
--                And the user should be informed he won
--                And the game should finish
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (3, 4, 1024)
			board.set_cell (4, 4, 1024)
			create controller.make_with_board (board)
			controller.up
			assert ("corner has a 2048", controller.board.elements [1, 4].value = 2048)
			assert ("game finished", controller.is_finished)
			assert ("winning board!", controller.board.is_winning_board)
		end

	move_up_makes_you_lose
--        Scenario: Moving up makes you lose
--                Given the game board is in state
--                        |2  |4  |8  |    |
--                        |4  |8  |16 |32  |
--                        |8  |16 |32 |64  |
--                        |16 |32 |64 |128 |
--                When I move up
--                Then I should obtain exactly
--                        |2  |4  |8  |32  |
--                        |4  |8  |16 |64  |
--                        |8  |16 |32 |128 |
--                        |16 |32 |64 | x  |
--                And x should be either 4 or 2
--                And the user should be informed he lost (game over)
--                And the game should finish
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (1, 1, 2)
			board.set_cell (1, 2, 4)
			board.set_cell (1, 3, 8)
			board.set_cell (2, 1, 4)
			board.set_cell (2, 2, 8)
			board.set_cell (2, 3, 16)
			board.set_cell (2, 4, 32)
			board.set_cell (3, 1, 8)
			board.set_cell (3, 2, 16)
			board.set_cell (3, 3, 32)
			board.set_cell (3, 4, 64)
			board.set_cell (4, 1, 16)
			board.set_cell (4, 2, 32)
			board.set_cell (4, 3, 64)
			board.set_cell (4, 4, 128)
			create controller.make_with_board (board)
			controller.up
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("game finished", controller.is_finished)
					assert ("user did not win!", not controller.board.is_winning_board)
					assert ("coordinates of new cell is (4,4)", row_new = 4 and col_new = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

end
