note
	description: "Summary description for {MOVE_UP_FEATURE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE_UP_FEATURE

inherit

	EQA_TEST_SET
	--		redefine
	--			on_prepare,
	--			on_clean
	--		end

feature {NONE} -- Events

		--	on_prepare
		-- <Precursor>
		--		do
		-- assert ("not_implemented", False)
		--		end

		--	on_clean
		-- <Precursor>
		--		do
		-- assert ("not_implemented", False)
		--		end

feature -- Test routines

	move_up_colapsing_cells
--Scenario: Moving up changes board state colapsing crashing cells with
--                        similar values
--              Given the game board is in state
--                        |  |  | 2|  |
--                        |  |  | 2|  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                When I move up
--                Then I should obtain
--                        |  |  |4 |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell(1,3,2)
			board.set_cell(2,3,2)
			create controller.make_with_board(board)
			controller.up
			assert ("position 1,3 has a four", controller.board.elements[1,3].value=4)
			assert ("board has two filled cells", controller.board.nr_of_filled_cells=2)
		end

		move_up_colapsing_cells_with_different_values
--       Scenario: Moving up changes board state colapsing crashing cells with
--                        similar values
--                Given the game board is in state
--                        |  |  | 2|  |
--                        |  |  | 4|  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                When I move up
--                Then I should obtain
--                        |  |  |2 |  |
--                        |  |  |4 |  |
--                        |  |  |  |  |
--                        |  |  |  |  |

		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell(1,3,2)
			board.set_cell(2,3,4)
			create controller.make_with_board(board)
			controller.up
			assert ("position 1,3 has a two", controller.board.elements[1,3].value=2)
			assert ("position 2,3 has a four", controller.board.elements[2,3].value=4)
			assert ("board has two filled cells", controller.board.nr_of_filled_cells=2)
		end

		move_up_movement_of_cells
--       Scenario: Moving up changes board state colapsing crashing cells with
--                        similar values
--                Given the game board is in state
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |  | 4|  |  |
--                When I move up
--                Then I should obtain
--                        |  | 4|  |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell(4,2,4)
			create controller.make_with_board(board)
			controller.up
			assert ("position 1,2 has a four", controller.board.elements[1,2].value=4)
			assert ("board has twho filled cells", controller.board.nr_of_filled_cells=2)
		end


	move_up_colapsing_cells_with_three_similar_values
--       Scenario: Moving up changes board state colapsing crashing cells with
--                        similar values
--                Given the game board is in state
--                        |  |  | 2|  |
--                        |  |  | 2|  |
--                        |  |  | 2|  |
--                        |  |  |  |  |
--                When I move up
--                Then I should obtain
--                        |  |  |4 |  |
--                        |  |  |2 |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                And one of the empty cells remaining filled with 2 or 4.


		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell(1,3,2)
			board.set_cell(2,3,2)
			board.set_cell(3,3,2)
			create controller.make_with_board(board)
			controller.up
			assert ("position 1,3 has a four", controller.board.elements[1,3].value=4)
			assert ("position 2,3 has a two", controller.board.elements[2,3].value=2)
			assert ("board has three filled cells", controller.board.nr_of_filled_cells=3)
		end

		move_up_no_action
--       Scenario: Moving up changes board state
--                Given the game board is in state
--                        |  | 4| 2|  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                When I move up
--                Then I should obtain
--                        |  | 4|2 |  |
--                        |  |  |  |  |
--                        |  |  |  |  |
--                        |  |  |  |  |

		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell(1,2,4)
			board.set_cell(1,3,2)
			create controller.make_with_board(board)
			controller.up
			assert ("position 1,2 has a four", controller.board.elements[1,2].value=4)
			assert ("position 1,3 has a two", controller.board.elements[1,3].value=2)
			assert ("board has twho filled cells", controller.board.nr_of_filled_cells=2)
		end


end
