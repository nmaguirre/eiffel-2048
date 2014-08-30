note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	SET_CELL_AT_BOARD_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	set_cell_with_valid_value
			--set_cell testing with a valid value and valid indices. It should save the value in the correct cell

		local
			board : BOARD_2048
		do
			create board.make_empty
			board.set_cell(1,1,2)
			assert ("2 is  a valid value of cell, this test should return true", board.elements.item(1,1).value = 2)
		end

	set_cell_with_negative_value
			--set_cell testing with a negative value and valid indices. It should break precondition

		local
			ok, second_time: BOOLEAN
			board : BOARD_2048
		do
			if not second_time then
				ok := True
				create board.make_empty
				board.set_cell(1,1,(-2))
				ok := False
			end
			assert ("-2 is not a valid value of cell, this test should return false", ok)
			rescue
			second_time := True
			if ok then
				retry
			end

		end

	set_cell_with_invalid_value
			--set_cell testing with a invalid value and valid indices. It should break precondition

		local
			ok, second_time: BOOLEAN
			board : BOARD_2048
		do
			if not second_time then
				ok := True
				create board.make_empty
				board.set_cell(1,1,3)
				ok := False
			end
			assert ("3 is not a valid value of cell, this test should return false", ok)
			rescue
			second_time := True
			if ok then
				retry
			end

		end

	set_cell_in_negative_row
			--set_cell testing with index out of range. It should break precondition

		local
			ok, second_time: BOOLEAN
			board : BOARD_2048
		do
			if not second_time then
				ok := True
				create board.make_empty
				board.set_cell((-1),1,2)
				ok := False
			end
			assert ("-1 is not a valid value of index, this test should return false", ok)
			rescue
			second_time := True
			if ok then
				retry
			end

		end

	set_cell_in_negative_column
			--set_cell testing with index out of range. It should break precondition

		local
			ok, second_time: BOOLEAN
			board : BOARD_2048
		do
			if not second_time then
				ok := True
				create board.make_empty
				board.set_cell(1,(-1),2)
				ok := False
			end
			assert ("-1 is not a valid value of index, this test should return false", ok)
			rescue
			second_time := True
			if ok then
				retry
			end

		end

	set_cell_with_row_index_out_of_range
			--set_cell testing with index out of range. It should break precondition

		local
			ok, second_time: BOOLEAN
			board : BOARD_2048
		do
			if not second_time then
				ok := True
				create board.make_empty
				board.set_cell((6),1,2)
				ok := False
			end
			assert ("6 is not a valid value of index, this test should return false", ok)
			rescue
			second_time := True
			if ok then
				retry
			end

		end

	set_cell_with_column_index_out_of_range
			--set_cell testing with index out of range. It should break precondition
			
		local
			ok, second_time: BOOLEAN
			board : BOARD_2048
		do
			if not second_time then
				ok := True
				create board.make_empty
				board.set_cell(1,6,2)
				ok := False
			end
			assert ("6 is not a valid value of index, this test should return false", ok)
			rescue
			second_time := True
			if ok then
				retry
			end

		end

end


