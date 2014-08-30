note
	description: "Summary description for {RIGHT_CONTROLLER_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RIGHT_CONTROLLER_2048

inherit
	EQA_TEST_SET

feature --Test routines

	test_movs_right
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
			board      : BOARD_2048
			controller : CONTROLLER_2048
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
			if controller.board.elements.item(1, 2).value = 2 and
			   controller.board.elements.item(1, 3).value = 4 and
			   controller.board.elements.item(1, 4).value = 4 and
               controller.board.elements.item(2, 3).value = 8 and
			   controller.board.elements.item(2, 4).value = 2 and
			   controller.board.elements.item(3, 4).value = 2
		       then
		       print("The board has moved right correctly")
			   --assert("The board has moved right correctly", True)
			else
			   print("The board has not moved right correctly")
			   --assert("The board has not moved right correctly", False)
			end
		end

	test_movs_right_cell_value_is_valid
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
			board                : BOARD_2048
			controller           : CONTROLLER_2048
			i, j, count_incorrect: INTEGER
		do
			create board.make_empty
			create controller.make_with_board(board)
			controller.board.set_cell(1, 2, 16)
			controller.board.set_cell(1, 4, 16)
			controller.board.set_cell(2, 1, 32)
			controller.board.set_cell(2, 3, 32)
			controller.board.set_cell(3, 2, 64)
			controller.board.set_cell(3, 3, 64)
			controller.board.set_cell(4, 1, 128)
			controller.board.set_cell(4, 4, 128)
			controller.right
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
					if board.elements.item(i, j).value /= 0 then
					   if not board.elements.item(i, j).is_valid_value(board.elements.item(i, j).value) then
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
			   print("The value of some cells is not valid")
			else
			   print("All cells have valid values")
			end
		end --end do

end

