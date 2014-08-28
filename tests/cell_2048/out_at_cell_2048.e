note
	description: "[
		Tests for the out routine in class CELL_2048.
	]"
	author: "Angelo Chaves"
	date: "August 28, 2014"
	revision: "0.01"
	testing: "type/manual"

class
	OUT_AT_CELL_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	out_at_cell_2048_with_value_zero_test
			-- Test with a cell with value zero.
		local
			string: STRING
			cell: CELL_2048
		do
			create cell.make_with_value(0)
			create string.make_from_string (" ")
			assert ("The output string is a blank space", equal(cell.out,string))
		end

	out_at_cell_2048_with_value_two_test
			-- Test with a cell with value two (any other value should be the same).
		local
			string: STRING
			cell: CELL_2048
		do
			create string.make_from_string ("2")
			create cell.make_with_value(2)
			assert ("The output string is the number 2", equal(cell.out,string))
		end

end


