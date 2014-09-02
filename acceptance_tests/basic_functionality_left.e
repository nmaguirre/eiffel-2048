note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BASIC_FUNCTIONALITY_LEFT

inherit

	EQA_TEST_SET

feature -- Test routines

	move_left_colapsing_cells
			--        Scenario: Moving left changes board state colapsing crashing cells with
			--                        similar values
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |2 |2 |
			--                When I move left
			--                And the randomly picked coordinate for the new cell is (x,y)
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |4 |  |  |  |
			--                And (x,y) must be different from (4,1)
			--                And the board in position (x,y) should be filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (4, 3, 2)
			board.set_cell (4, 4, 2)
			create controller.make_with_board (board)
			assert ("can move left!", controller.board.can_move_left)
				-- moving left
			controller.left
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("corner has a four", controller.board.elements [4, 1].value = 4)
					assert ("board has two filled cells", controller.board.nr_of_filled_cells = 2)
					assert ("coordinates of new cell is not (4,1)", row_new /= 4 or col_new /= 1)
					assert ("new cell has a 2 or a 4", controller.board.elements [row_new, col_new].value = 2 or controller.board.elements [row_new, col_new].value = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

	move_left_without_colapsing_cells
			--        Scenario: Moving left changes board state without crashing cells with
			--                        similar values
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |2 |  |  |  |
			--                        |  |  |  |2 |
			--                When I move left
			--                And the randomly picked coordinate for the new cell is (x,y)
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |2 |  |  |  |
			--                        |2 |  |  |  |
			--                And (x,y) must be different from (4,1) and (3,1)
			--                And the board in position (x,y) should be filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (3, 1, 2)
			board.set_cell (4, 4, 2)
			create controller.make_with_board (board)
			controller.left
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("corner has a 2", controller.board.elements [4, 1].value = 2)
					assert ("(3,1) has a 2", controller.board.elements [3, 1].value = 2)
					assert ("board has three filled cells", controller.board.nr_of_filled_cells = 3)
					assert ("coordinates of new cell is not (4,1)", row_new /= 4 or col_new /= 1)
					assert ("coordinates of new cell is not (3,1)", row_new /= 3 or col_new /= 1)
					assert ("new cell has a 2 or a 4", controller.board.elements [row_new, col_new].value = 2 or controller.board.elements [row_new, col_new].value = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

	move_left_with_colapsing_cells_and_residual
			--        Scenario: Moving left changes board state with crashing cells with
			--                        similar values leaving residual matching cells
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |2 |2 |2 |
			--                When I move left
			--                And the randomly picked coordinate for the new cell is (x,y)
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |4 |2 |  |  |
			--                And (x,y) must be different from (4,1) and (4,2)
			--                And the board in position (x,y) should be filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (4, 2, 2)
			board.set_cell (4, 3, 2)
			board.set_cell (4, 4, 2)
			create controller.make_with_board (board)
			controller.left
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("corner has a 4", controller.board.elements [4, 1].value = 4)
					assert ("(4,2) has a 2", controller.board.elements [4, 2].value = 2)
					assert ("board has three filled cells", controller.board.nr_of_filled_cells = 3)
					assert ("coordinates of new cell is not (4,1)", row_new /= 4 or col_new /= 1)
					assert ("coordinates of new cell is not (4,2)", row_new /= 4 or col_new /= 2)
					assert ("new cell has a 2 or a 4", controller.board.elements [row_new, col_new].value = 2 or controller.board.elements [row_new, col_new].value = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

	move_left_with_colapsing_cells_and_residual_tail
			--        Scenario: Moving left changes board state with crashing cells with
			--                        similar values leaving other residual matching cells
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |2 |2 |4 |
			--                When I move left
			--                And the randomly picked coordinate for the new cell is (x,y)
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |4 |4 |  |  |
			--                And (x,y) must be different from (4,1) and (4,2)
			--                And the board in position (x,y) should be filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (4, 2, 2)
			board.set_cell (4, 3, 2)
			board.set_cell (4, 4, 4)
			create controller.make_with_board (board)
			controller.left
			if attached {INTEGER} controller.last_random_cell_coordinates.item (1) as row_new then
				if attached {INTEGER} controller.last_random_cell_coordinates.item (2) as col_new then
					assert ("corner has a 4", controller.board.elements [4, 1].value = 4)
					assert ("(4,2) has a 4", controller.board.elements [4, 2].value = 4)
					assert ("board has three filled cells", controller.board.nr_of_filled_cells = 3)
					assert ("coordinates of new cell is not (4,1)", row_new /= 4 or col_new /= 1)
					assert ("coordinates of new cell is not (4,2)", row_new /= 4 or col_new /= 2)
					assert ("new cell has a 2 or a 4", controller.board.elements [row_new, col_new].value = 2 or controller.board.elements [row_new, col_new].value = 4)
				else
					assert ("invalid coordinate", False)
				end
			else
				assert ("invalid coordinate", False)
			end
		end

	move_left_not_changing_board
			--        Scenario: Moving left does not change the board
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |8 |4 |2 |  |
			--                When I move left
			--                Then I should obtain exactly
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |8 |4 |2 |  |
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (4, 1, 8)
			board.set_cell (4, 2, 4)
			board.set_cell (4, 3, 2)
			create controller.make_with_board (board)
			assert ("cannot move left", not board.can_move_left)
		end

	move_left_makes_you_win
			--        Scenario: Moving left makes you win
			--                Given the game board is in state
			--                        |  |  |     |     |
			--                        |  |  |     |     |
			--                        |  |  |     |     |
			--                        |  |  |1024 |1024 |
			--                When I move left
			--                Then I should obtain exactly
			--                        |     |  |  |  |
			--                        |     |  |  |  |
			--                        |     |  |  |  |
			--                        |2048 |  |  |  |
			--                And the user should be informed he won
			--                And the game should finish
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell (4, 3, 1024)
			board.set_cell (4, 4, 1024)
			create controller.make_with_board (board)
			controller.left
			assert ("corner has a 2048", controller.board.elements [4, 1].value = 2048)
			assert ("game finished", controller.is_finished)
			assert ("winning board!", controller.board.is_winning_board)
		end

	move_left_makes_you_lose
			--        Scenario: Moving left makes you lose
			--                Given the game board is in state
			--                        |2  |4  |8  |32  |
			--                        |4  |8  |16 |64  |
			--                        |8  |16 |32 |128 |
			--                        |   |32 |64 |128 |
			--                When I move left
			--                Then I should obtain exactly
			--                        |2  |4  |8  |32  |
			--                        |4  |8  |16 |64  |
			--                        |8  |16 |32 |128 |
			--                        |32 |64 |128| x  |
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
			board.set_cell (1, 4, 32)
			board.set_cell (2, 1, 4)
			board.set_cell (2, 2, 8)
			board.set_cell (2, 3, 16)
			board.set_cell (2, 4, 64)
			board.set_cell (3, 1, 8)
			board.set_cell (3, 2, 16)
			board.set_cell (3, 3, 32)
			board.set_cell (3, 4, 128)
			board.set_cell (4, 2, 32)
			board.set_cell (4, 3, 64)
			board.set_cell (4, 4, 128)
			create controller.make_with_board (board)
			controller.left
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
