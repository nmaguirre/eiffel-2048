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
			--                        |2 |  |2 |  |
			--                        |8 |  |  |  |
			--                        |  |8 |  |8 |
			--                        |  |  |  |32|
			--                When I move RIGHT
			--                Then I should obtain
			--                        |  |  |  |4 |
			--                        |  |  |  |8 |
			--                        |  |  |  |16|
			--                        |  |  |  |32|
			--                And one of the empty cells remaining filled with 2.

		local
			board : BOARD_2048
			controller : CONTROLLER_2048
			correct_movs : BOOLEAN
		do
			create board.make_empty
			create controller.make_with_board(board)
			board.set_cell(1, 1, 2)
			board.set_cell(1, 3, 2)
			board.set_cell(2, 1, 8)
			board.set_cell(3, 2, 8)
			board.set_cell(3, 4, 8)
			board.set_cell(4, 4, 32)
			controller.right
			if board.elements.item(1, 4).value = 4 and
			   board.elements.item(2, 4).value = 8 and
			   board.elements.item(3, 4).value = 16 and
			   board.elements.item(4, 4).value = 32
			  then
	           correct_movs := true
			   assert("The board has moved right correctly", correct_movs)
			else
	           correct_movs := false
			   assert("The board has not moved right correctly", correct_movs)
			end
		end

end

