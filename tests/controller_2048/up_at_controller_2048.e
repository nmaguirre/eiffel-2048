note
	description: "Test of 'up' in class CONTROLLER_2048."
	author: "jjaimez"
	date: "August 27, 2014"
	revision: " "
class
	UP_AT_CONTROLLER_2048

inherit
	EQA_TEST_SET

	feature -- Test routines

		test_up_with_empty_board
		local
			controller: CONTROLLER_2048
			board: BOARD_2048
			ok, second_time: BOOLEAN
		do
			if not second_time then
          		ok := True
				create board.make_empty
				create controller.make_with_board (board)
				controller.up -- Must throw an exception
				ok := False
			end
    		assert ("The rutine has to fail", ok)
			rescue
     			second_time := True
     			if ok then   -- ok = true means that the rutine failed
           			retry
    			end
		end

	test_up_with_can_move_up_with_colapses
			--  2 |	0 | x | x
			--	2 | 0 | x | x
			--	2 | 4 | x | x
			--	4 | 4 | x | x
		local
			controller: CONTROLLER_2048
			board: BOARD_2048
		do
			create board.make
			create controller.make_with_board (board)
			controller.board.set_cell (1, 1, 2)
			controller.board.set_cell (2, 1, 2)
			controller.board.set_cell (3, 1, 2)
			controller.board.set_cell (4, 1, 4)
			controller.board.set_cell (1, 2, 0)
			controller.board.set_cell (2, 2, 0)
			controller.board.set_cell (3, 2, 4)
			controller.board.set_cell (4, 2, 4)
			controller.up
			assert (" the value of cell [1,1] must be 4 ", controller.board.elements.item (1, 1).value = 4)
			assert (" the value of cell [2,1] must be 2 ", controller.board.elements.item (2, 1).value = 2)
			assert (" the value of cell [3,1] must be 4 ", controller.board.elements.item (3, 1).value = 4)
			assert (" the value of cell [1,2] must be 8 ", controller.board.elements.item (1, 2).value = 8)
		end

	test_up_with_can_move_up_with_out_colapses
			--  x |	x | 0 | x
			--	x | x | 0 | x
			--	x | x | 2 | x
			--	x | x | 0 | x
		local
			controller: CONTROLLER_2048
			board: BOARD_2048
		do
			create board.make
			create controller.make_with_board (board)
			controller.board.set_cell (1, 3, 0)
			controller.board.set_cell (2, 3, 0)
			controller.board.set_cell (3, 3, 2)
			controller.board.set_cell (4, 3, 0)
			controller.up
			assert (" the value of cell [1,3] must be 2 ", controller.board.elements.item (1, 3).value = 2)
		end

	test_up_with_can_move_up_with_out_colapses_2
			--  x |	x | x | 2
			--	x | x | x | 0
			--	x | x | x | 0
			--	x | x | x | 0
		local
			controller: CONTROLLER_2048
			board: BOARD_2048
		do
			create board.make
			create controller.make_with_board (board)
			controller.board.set_cell (1, 4, 2)
			controller.board.set_cell (2, 4, 0)
			controller.board.set_cell (3, 4, 0)
			controller.board.set_cell (4, 4, 0)
			controller.up
			assert (" the value of cell [1,4] must be 2 ", controller.board.elements.item (1, 4).value = 2)
		end



end
