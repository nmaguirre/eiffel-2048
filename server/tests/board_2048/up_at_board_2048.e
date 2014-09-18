note
	description: "Test of 'up' in class CONTROLLER_2048."
	author: "jjaimez"
	date: "August 27, 2014"
	revision: "0.01"
class
	UP_AT_BOARD_2048

inherit
	EQA_TEST_SET

	feature -- Test routines

		test_up_with_cant_move_up
				-- Scenario: can't move up, pre condition is violated.
				-- Given the game board is in state, when I move up the funtion throw an error.
				--  2 |	2 | 2 | 2
				--	4 | 4 | 4 | 4
				--	2 | 2 | 2 | 2
				--	4 | 4 | 4 | 4	
		local
			board: BOARD_2048
			ok, second_time: BOOLEAN
		do
			if not second_time then
          		ok := True
				create board.make
				board.set_cell (1, 1, 2)
				board.set_cell (2, 1, 4)
				board.set_cell (3, 1, 2)
				board.set_cell (4, 1, 4)
				board.set_cell (1, 2, 2)
				board.set_cell (2, 2, 4)
				board.set_cell (3, 2, 2)
				board.set_cell (4, 2, 4)
				board.set_cell (1, 3, 2)
				board.set_cell (2, 3, 4)
				board.set_cell (3, 3, 2)
				board.set_cell (4, 3, 4)
				board.set_cell (1, 4, 2)
				board.set_cell (2, 4, 4)
				board.set_cell (3, 4, 2)
				board.set_cell (4, 4, 4)
				board.up -- Must throw an exception
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
			-- Scenario: Moving up changes board state collapsing crashing cells with similar and different values.
			-- Given the game board is in state
			--  2 |	0 | x | x
			--	2 | 0 | x | x
			--	2 | 4 | x | x
			--	4 | 4 | x | x
			-- When i move up, then I should obtain
			--  4 |	8 | x | x
			--	2 | 0 | x | x
			--	4 | 0 | x | x
			--	0 | 0 | x | x

		local
			board: BOARD_2048
			aux: INTEGER
		do
			create board.make
			board.set_cell (1, 1, 2)
			board.set_cell (2, 1, 2)
			board.set_cell (3, 1, 2)
			board.set_cell (4, 1, 4)
			board.set_cell (1, 2, 0)
			board.set_cell (2, 2, 0)
			board.set_cell (3, 2, 4)
			board.set_cell (4, 2, 4)
			aux := board.nr_of_filled_cells
			board.up
			assert (" the value of cell [1,1] must be 4 ", board.elements.item (1, 1).value = 4)
			assert (" the value of cell [2,1] must be 2 ", board.elements.item (2, 1).value = 2)
			assert (" the value of cell [3,1] must be 4 ", board.elements.item (3, 1).value = 4)
			assert (" the value of cell [1,2] must be 8 ", board.elements.item (1, 2).value = 8)
			assert (" the number of filled cells must be less", aux > board.nr_of_filled_cells)
		end

	test_move_up_movement_of_cells
			--  Scenario: Moving up changes board state moving all cells to the topmost  empty cell.
			-- Given the game board is in state
			--  x |	x | 0 | x
			--	x | x | 0 | x
			--	x | x | 2 | x
			--	x | x | 0 | x
			-- When i move up, then I should obtain
			--  x |	x | 2 | x
			--	x | x | 0 | x
			--	x | x | 0 | x
			--	x | x | 0 | x
		local
			board: BOARD_2048
		do
			create board.make
			board.set_cell (1, 3, 0)
			board.set_cell (2, 3, 0)
			board.set_cell (3, 3, 2)
			board.set_cell (4, 3, 0)
			board.up
			assert (" the value of cell [1,3] must be 2 ", board.elements.item (1, 3).value = 2)
		end

	test_up_with_cant_move_up_2
			-- Scenario: can't move up, pre condition is violated.
			-- Given the game board is in state, when I move up the funtion throw an error.
			--  2 | 2 | 2 | 2
			--	0 | 0 | 0 | 0
			--	0 | 0 | 0 | 0
			--	0 | 0 | 0 | 0		
		local
			board: BOARD_2048
			ok, second_time: BOOLEAN
		do
			if not second_time then
		   		ok := True
				create board.make_empty
				board.set_cell (1, 1, 2)
				board.set_cell (1, 2, 2)
				board.set_cell (1, 3, 2)
				board.set_cell (1, 4, 2)
				board.up -- Must throw an exception
				ok := False
			end
		    assert ("The rutine has to fail", ok)
			rescue
		    	second_time := True
		     	if ok then   -- ok = true means that the rutine failed
		        	retry
		    	end
		end
end
