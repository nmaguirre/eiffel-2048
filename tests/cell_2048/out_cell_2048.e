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
		assert("The value is correct: ", board.elements.item(1,1).out.is_equal("    "))

	end


out_equal_two_value_cell_one_digit
	local
		board: BOARD_2048

	do
		create board.make_empty
		board.elements.item(1,2).set_value(2)
		assert("The value is correct: ", board.elements.item(1,2).out.is_equal("   2"))

	end

out_power_of_two_cell_two_digits
   local
		board: BOARD_2048

	do
		create board.make_empty
		board.elements.item (1,3).set_value (64)
		assert("The value is correct: ", board.elements.item(1,3).out.is_equal("  64"))

	end

out_power_of_two_cell_three_digits
   local
		board: BOARD_2048

	do
		create board.make_empty
		board.elements.item (1,3).set_value (256)
		assert("The value is correct: ", board.elements.item(1,3).out.is_equal(" 256"))

	end

out_power_of_two_cell_four_digits
   local
		board: BOARD_2048

	do
		create board.make_empty
		board.elements.item (1,3).set_value (2048)
		assert("The value is correct: ", board.elements.item(1,3).out.is_equal("2048"))

	end

out_distinct_value_zero_cell
	local
		board: BOARD_2048
	do
		create board.make_empty
		board.elements.item (1,4).set_value(0)
		assert("The value is correct: ", not board.elements.item(1,4).out.is_equal("   2"))

	end


end
