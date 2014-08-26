note
	description: "Test class for routine make at CELL_2048"
	author: "lputruele"
	date: "August 26, 2014"
	revision: "0.01"

class
	MAKE_AT_CELL_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	creation_test_default_constructor
			-- Creation test with default constructor
		local
			cell : CELL_2048
		do
			create cell.make
			assert ("The cell new value must be 0 ", cell.value = 0)
		end

end
