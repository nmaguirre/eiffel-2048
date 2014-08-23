 note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	MOVE_RIGHT_FEATURE

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

	move_right_colapsing_cells
			--	        Scenario: Moving right changes board state colapsing crashing cells with
			--                        similar values
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |2 |2 |
			--                When I move right
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |4 |
			--                And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell(4,3,2)
			board.set_cell(4,4,2)
			create controller.make_with_board(board)
			controller.right
			assert ("corner has a four", controller.board.elements[4,4].value=4)
			assert ("board has two filled cells", controller.board.nr_of_filled_cells=2)
		end

		move_right_colapsing_cells_with_different_values
			--	        Scenario: Moving right does not change board state colapsing crashing cells with
			--                        different values
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |2 |4 |
			--                When I move right
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |2 |4 |
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell(4,3,2)
			board.set_cell(4,4,4)
			create controller.make_with_board(board)
			controller.right
			assert ("position 4,3 has a two", controller.board.elements[4,3].value=2)
			assert ("corner has a four", controller.board.elements[4,4].value=4)
			assert ("board has two filled cells", controller.board.nr_of_filled_cells=2)
		end

		move_right_movement_of_cells
			--	        Scenario: Moving right changes board state moving all cells to the rightmost
			--                        empty cell
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |2 |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                When I move right
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |2 |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			board.set_cell(2,1,2)
			create controller.make_with_board(board)
			controller.right
			assert ("position 2,4 has a two", controller.board.elements[2,4].value=2)
			assert ("board has two filled cells", controller.board.nr_of_filled_cells=2)
		end



end
