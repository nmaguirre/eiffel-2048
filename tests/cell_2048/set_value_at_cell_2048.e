note
	description: "Summary description for {SET_VALUE_AT_CELL_2048}."
	author: "alangonzalez93"
	date: "August 26 2014"
	revision: "0.01"

class
	SET_VALUE_AT_CELL_2048

inherit

	EQA_TEST_SET

feature

	set_value_test_with_correct_value
		local
			cell: CELL_2048
		do
			create cell.make_with_value (0)
			cell.set_value (2)
			assert ("cell value should be 2", cell.value = 2)
		end

	set_value_test_with_correct_value2
		local
			cell: CELL_2048
		do
			create cell.make_with_value (0)
			cell.set_value (1028)
			assert ("cell value should be 2", cell.value = 1028)
		end

	set_value_test_with_wrong_value
		local
			cell: CELL_2048
		do
			create cell.make_with_value (0)
			cell.set_value (1999) -- the value of cell should not change
			assert ("cell value should be 0", cell.value = 0)
		end

	set_value_test_with_wrong_value2
		local
			cell: CELL_2048
		do
			create cell.make_with_value (0)
			cell.set_value (3) -- the value of cell should not change
			assert ("cell value should be 0", cell.value = 0)
		end

end
