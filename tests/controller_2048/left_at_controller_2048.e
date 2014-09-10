note
	description: "Test class for LEFT_AT_CONTROLLER_2048 class"
	author: "Max Cejuela, Bruno Isoardi and Guido Giovannini"
	date: "September 9, 2014"
	revision: "0.01"
	testing: "type/manual"

class
	LEFT_AT_CONTROLLER_2048

inherit

	EQA_TEST_SET

feature -- Test routines

	one_element_board_test

			--Given the game board is in state
			-- | | | | |
			-- | | | | |
			-- | | | | |
			-- | |2| | |
			--move at left
			---| | | | |
			-- | | | | |
			-- | | | | |
			-- |2| | | |
			--Correct score to move left
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			create controller.make_with_board (board)
			controller.board.set_cell (4, 2, 2)
			controller.left
			assert ("Row one correct", controller.board.elements.item (4, 1).value = 2)
		end

	one_item_per_row

			--Given the game board is in state
			-- |8| | | |
			-- | |8| | |
			-- | | |4| |
			-- | | | |4|
			--move at left
			---|8| | | |
			-- |8| | | |
			-- |4| | | |
			-- |4| | | |
			-- Correct score to move left
			-- And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			create controller.make_with_board (board)
			controller.board.set_cell (1, 1, 8)
			controller.board.set_cell (2, 2, 8)
			controller.board.set_cell (3, 3, 4)
			controller.board.set_cell (4, 4, 4)
			controller.left
			assert ("Row one correct", controller.board.elements.item (1, 1).value = 8)
			assert ("Row Two correct", controller.board.elements.item (2, 1).value = 8)
			assert ("Row Three correct", controller.board.elements.item (3, 1).value = 4)
			assert ("Row Four correct", controller.board.elements.item (4, 1).value = 4)
			assert ("Number of filled cells must be five", controller.board.nr_of_filled_cells = 5)
		end

	test_move_left
			--Given the game board is in state
			-- |2 |4 | | |
			-- |4 |4 | | |
			-- |8 |8 | | |
			-- |4 |16| | |
			--move at left
			---|2 |4 | | |
			-- |8 |  | | |
			-- |16|  | | |
			-- |4 |16| | |
			--Correct score to move left
			-- And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			create controller.make_with_board (board)
			controller.board.set_cell (1, 1, 2)
			controller.board.set_cell (1, 2, 4)
			controller.board.set_cell (2, 1, 4)
			controller.board.set_cell (2, 2, 4)
			controller.board.set_cell (3, 1, 8)
			controller.board.set_cell (3, 2, 8)
			controller.board.set_cell (4, 1, 4)
			controller.board.set_cell (4, 2, 16)
			controller.left
			assert ("Row One correct", not (controller.board.elements.item (1, 1).value /= 2 or controller.board.elements.item (1, 2).value /= 4))
			assert ("Row Two correct", not (controller.board.elements.item (2, 1).value /= 8))
			assert ("Row Three correct", not (controller.board.elements.item (3, 1).value /= 16))
			assert ("Row Four correct", not (controller.board.elements.item (4, 1).value /= 4 or controller.board.elements.item (4, 2).value /= 16))
		end

	test_move_left2
			--Given the game board is in state
			-- |2|2|4|4|
			-- |2|4|4|2|
			-- |8|4|2|2|
			-- |2|2|4|8|
			--move at left
			---|4|8| | |
			-- |2|8|2| |
			-- |8|4|4| |
			-- |4|4|8| |
			--Correct score to move left
			-- And one of the empty cells remaining filled with 2 or 4.
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			create controller.make_with_board (board)
			controller.board.set_cell (1, 1, 2)
			controller.board.set_cell (1, 2, 2)
			controller.board.set_cell (1, 3, 4)
			controller.board.set_cell (1, 4, 4)
			controller.board.set_cell (2, 1, 2)
			controller.board.set_cell (2, 2, 4)
			controller.board.set_cell (2, 3, 4)
			controller.board.set_cell (2, 4, 2)
			controller.board.set_cell (3, 1, 8)
			controller.board.set_cell (3, 2, 4)
			controller.board.set_cell (3, 3, 2)
			controller.board.set_cell (3, 4, 2)
			controller.board.set_cell (4, 1, 2)
			controller.board.set_cell (4, 2, 2)
			controller.board.set_cell (4, 3, 4)
			controller.board.set_cell (4, 4, 8)
			controller.left
			assert ("1,1", controller.board.elements.item (1, 1).value = 4)
			assert ("1,2", controller.board.elements.item (1, 2).value = 8)
			assert ("2,1", controller.board.elements.item (2, 1).value = 2)
			assert ("2,2", controller.board.elements.item (2, 2).value = 8)
			assert ("2,3", controller.board.elements.item (2, 3).value = 2)
			assert ("3,1", controller.board.elements.item (3, 1).value = 8)
			assert ("3,2", controller.board.elements.item (3, 2).value = 4)
			assert ("3,3", controller.board.elements.item (3, 3).value = 4)
			assert ("4,1", controller.board.elements.item (4, 1).value = 4)
			assert ("4,2", controller.board.elements.item (4, 2).value = 4)
			assert ("4,3", controller.board.elements.item (4, 3).value = 8)
		end

	test_move_left3
			--Given the game board is in state
			-- |2| | | |
			-- |4| |4|2|
			-- | |2|2|2|
			-- |4| |4| |
			--move at left
			---|2| | | |
			-- |8|2| | |
			-- |4|2| | |
			-- |8| | | |
			--Correct score to move left
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			create controller.make_with_board (board)
			controller.board.set_cell (1, 1, 2)
			controller.board.set_cell (2, 1, 4)
			controller.board.set_cell (2, 3, 4)
			controller.board.set_cell (2, 4, 2)
			controller.board.set_cell (3, 2, 2)
			controller.board.set_cell (3, 3, 2)
			controller.board.set_cell (3, 4, 2)
			controller.board.set_cell (4, 1, 4)
			controller.board.set_cell (4, 3, 4)
			controller.left
			assert ("1,1", (controller.board.elements.item (1, 1).value = 2))
			assert ("2,1", (controller.board.elements.item (2, 1).value = 8))
			assert ("2,2", (controller.board.elements.item (2, 2).value = 2))
			assert ("3,1", (controller.board.elements.item (3, 1).value = 4))
			assert ("3,2", (controller.board.elements.item (3, 2).value = 2))
			assert ("4,1", (controller.board.elements.item (4, 1).value = 8))
		end

	test_move_left4
			--Given the game board is in state
			-- |4  |4  |2 |2 |
			-- |16 |16 |8 |8 |
			-- |32 |32 |16|16|
			-- |128|128|64|64|
			--move at left
			---|8  |4   | | |
			-- |32 |16  | | |
			-- |64 |32  | | |
			-- |256|128 | | |
			--Correct score to move left
		local
			board: BOARD_2048
			controller: CONTROLLER_2048
		do
			create board.make_empty
			create controller.make_with_board (board)
			controller.board.set_cell (1, 1, 4)
			controller.board.set_cell (1, 2, 4)
			controller.board.set_cell (1, 3, 2)
			controller.board.set_cell (1, 4, 2)
			controller.board.set_cell (2, 1, 16)
			controller.board.set_cell (2, 2, 16)
			controller.board.set_cell (2, 3, 8)
			controller.board.set_cell (2, 4, 8)
			controller.board.set_cell (3, 1, 32)
			controller.board.set_cell (3, 2, 32)
			controller.board.set_cell (3, 3, 16)
			controller.board.set_cell (3, 4, 16)
			controller.board.set_cell (4, 1, 128)
			controller.board.set_cell (4, 2, 128)
			controller.board.set_cell (4, 3, 64)
			controller.board.set_cell (4, 4, 64)
			controller.left
			assert ("Row One correct", controller.board.elements.item (1, 1).value = 8 and controller.board.elements.item (1, 2).value = 4)
			assert ("Row Two correct", controller.board.elements.item (2, 1).value = 32 and controller.board.elements.item (2, 2).value = 16)
			assert ("Row Three correct", controller.board.elements.item (3, 1).value = 64 and controller.board.elements.item (3, 2).value = 32)
			assert ("Row Four correct", controller.board.elements.item (4, 1).value = 256 and controller.board.elements.item (4, 2).value = 128)
		end

end
