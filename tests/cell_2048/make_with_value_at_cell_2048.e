note
	description: "Summary description for {MAKE_AT_CELL_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MAKE_WITH_VALUE_AT_CELL_2048

inherit
	EQA_TEST_SET

feature --make_with_value test routines

	creation_test_constructor_with_value
		-- Creation test with determinate value constructor

		local
			cell : CELL_2048
		do
			create cell.make_with_value (8)
			assert ("the cell new value must be 8", cell.value = 8)
		end

end
