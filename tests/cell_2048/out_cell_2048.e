note
	description: "Tests for routine out at CELL_2048 class."
	author: "guille85"
	date: "September 2, 2014"
	revision: "0.01"
	testing: "type/manual"

class
	OUT_AT_CELL_2048

inherit
	EQA_TEST_SET

feature  -- test routines

out_empty_cell_test
	local
		board: BOARD_2048

	do
		create board.make_empty

		board.elements.item (1,1).set_value (0)




		if  board.elements.item(1,1).out.is_equal("") then
   			print("The value is correct: " + board.elements.item(1,1).out + "%N")
		else
			print("The value is incorrect")
		end
	end


out_equal_two_value_cell
	local
		board: BOARD_2048

	do
		create board.make_empty
		board.elements.item (1,2).set_value (2)
		if  board.elements.item(1,2).out.is_equal("2") then
   			print("The value is correct: " + board.elements.item(1,2).out + "%N")
		else
			print("The value is incorrect")
		end
	end

out_power_of_two_cell
   local
		board: BOARD_2048

	do
		create board.make_empty
		board.elements.item (1,3).set_value (4)
		if  board.elements.item(1,3).out.is_equal("4") then
   			print("The value is correct: " + board.elements.item(1,3).out + "%N")
		else
			print("The value is incorrect")
		end
	end

out_distinct_value_zero_cell
	local
		board: BOARD_2048
	do
		create board.make_empty
		board.elements.item (1,4).set_value (0)
		if  board.elements.item(1,4).out.is_equal("2") then
   			print("The value is correct: " + board.elements.item(1,4).out + "%N")
		else
			print("The value is incorrect %N")
		end
	end


out_distinct_empty_cell
	local
		board: BOARD_2048
	do
		create board.make_empty
		board.elements.item (2,1).set_value (8)
		if  board.elements.item(2,1).out.is_equal("") then
   			print("The value is correct: " + board.elements.item(2,1).out + "%N")
		else
			print("The value is incorrect %N")
		end

    end

end
