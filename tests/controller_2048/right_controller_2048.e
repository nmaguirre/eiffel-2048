note
	description: "Summary description for {DOWN_CONTROLLER_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RIGHT_CONTROLLER_2048

inherit
	EQA_TEST_SET

feature --Test routines

	TEST_MOVS_RIGHT
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
			board : BOARD_2048
			controller : CONTROLLER_2048
			correct_movs : BOOLEAN
		do
			create board.make_empty
			create controller.make_with_board(board)
			controller.board.set_cell(1, 1, 2)
			controller.board.set_cell(1, 2, 2)
			controller.board.set_cell(1, 3, 2)
			controller.board.set_cell(1, 4, 4)
			controller.board.set_cell(2, 1, 4)
			controller.board.set_cell(2, 3, 4)
			controller.board.set_cell(2, 4, 2)
			controller.board.set_cell(3, 1, 2)
			controller.right
			--if controller.board.elements.item(1, 2).value = 0 and
			 --  controller.board.elements.item(1, 3).value = 0 and
			--   controller.board.elements.item(1, 4).value = 0 and
--controller.board.elements.item(2, 3).value = 0 and
			  -- controller.board.elements.item(2, 4).value = 0 and
			  -- controller.board.elements.item(3, 4).value = 0
		--	  then
	        --   correct_movs := true
		--	   assert("The board has moved right correctly", correct_movs)
		--	else
	      --    correct_movs := false
		--	   assert("The board has not moved right correctly", correct_movs)
		--	end
		end

end

