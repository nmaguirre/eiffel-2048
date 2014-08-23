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

end
