note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	IS_AVAILABLE_AT_CELL_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	is_available_empty_cell_test
			-- Test for available cell
		local
			cell : CELL_2048
		do
			create cell.make
			assert ("The cell is available", cell.is_available )
		end

	is_available_ocupated_cell_test
			-- Test for not available cell
		local
			cell : CELL_2048
		do
			create cell.make_with_value (2)
			assert ("The cell is not available", not cell.is_available )
		end

end


