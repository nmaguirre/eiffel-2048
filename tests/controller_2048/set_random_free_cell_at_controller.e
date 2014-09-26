note
	description: "testing the generation of random coordinate to set starting an empty cell with a value that can be equal to 2 or 4"
	author: "lputruele and agusbauer"
	date: "09 September, 2014"
	revision: "type/manual"

class
	SET_RANDOM_FREE_CELL_AT_CONTROLLER
inherit
	--EQA_TEST_SET

feature -- Test routines


	test_with_empty_board
		-- test set random free cell on an empty board
	local
		controller:CONTROLLER_2048
		board:BOARD_2048
	do
		create board.make_empty
		create controller.make_with_board (board)
		controller.set_random_free_cell
		assert("board is not empty anymore",not board.is_empty)
	end

	test_with_board_with_only_one_available_cell
		-- test set random free cell on an empty board
	local
		controller:CONTROLLER_2048
		board:BOARD_2048
		i,j:INTEGER
	do
		create board.make_empty
		from
			i:=1
		until
			i>4
		loop
			from
				j:=1
			until
				j>4
			loop
				board.set_cell (i, j,2)
				j:=j+1
			end
			i:=i+1
		end
		board.set_cell (2, 2, 0)
		create controller.make_with_board (board)
		controller.set_random_free_cell
		assert("board is full now",board.is_full)
	end

	negative_test_with_full_board
		--test set ramdom free sell with a full board
	local
  		controller:CONTROLLER_2048
		board:BOARD_2048
		i,j:INTEGER
		ok, second_time: BOOLEAN
	do
		create board.make_empty
		from
			i:=1
		until
			i>4
		loop
			from
				j:=1
			until
				j>4
			loop
				board.set_cell (i, j,2)
				j:=j+1
			end
			i:=i+1
		end
		create controller.make_with_board (board)
    	if not second_time then
         	ok := True
          	controller.set_random_free_cell -- Must throw an exception
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
