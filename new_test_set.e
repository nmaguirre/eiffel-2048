note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	NEW_TEST_SET

inherit
	EQA_TEST_SET

feature -- Test routines

	CREATION_TEST_DEFAULT_CONTRUCTOR
			-- Creation test with default constructor
		local
			cell : CELL_2048
		do
			create cell.make
			assert ("The cell큦 new value must be 0", cell.value = 0)
		end


	CREATION_TEST_DEFAULT_CONTRUCTOR_1
			-- Creation test with default constructor
		local
			cell : CELL_2048
		do
			create cell.make
			assert ("The cell큦 new value must be 0", not (cell.value = 5))
		end


	CREATION_TEST_CONTRUCTOR_WITH_VALUE
			-- Creation test with determinate value constructor
		local
			cell : CELL_2048
		do
			create cell.make_with_value (8)
			assert ("The cell큦 value must be 8", cell.value = 8)
		end


	CREATION_TEST_CONTRUCTOR_WITH_VALUE_1
			-- Creation test with determinate value constructor
		local
			cell : CELL_2048
		do
			create cell.make_with_value (8)
			assert ("The cell큦 value must be 8", not(cell.value = 4))
		end


	--CREATION_TEST_CONTRUCTOR_WITH_VALUE_2
			-- Creation test with determinate value constructor
		--local
			--cell : CELL_2048
		--do
			--create cell.make_with_value (1)
			--assert ("The cell큦 value cant be 1", not(cell.value = 4))
		--end



end


