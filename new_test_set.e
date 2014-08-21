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


	CREATION_TEST_CONTRUCTOR_WITH_VALUE_TEST_NEGATIVO_1
			-- Creation test with non two potency number
		local
  			ok, second_time: BOOLEAN
  			cell: CELL_2048
		do
    		if not second_time then
          		ok := True
          		create cell.make_with_value (7) -- Must throw an exception
          		ok := False
    		end
    		assert ("The rutine has to fail", ok)
		rescue
     		second_time := True
     		if ok then   -- ok = true means that the rutine failed
           		retry
    		end
		end


	CREATION_TEST_CONTRUCTOR_WITH_VALUE_TEST_NEGATIVO_2
			-- Creation test with 1 value
		local
  			ok, second_time: BOOLEAN
  			cell: CELL_2048
		do
    		if not second_time then
          		ok := True
          		create cell.make_with_value (1) -- Must throw an exception
          		ok := False
    		end
    		assert ("The rutine has to fail", ok)
		rescue
     		second_time := True
     		if ok then   -- ok = true means that the rutine failed
           		retry
    		end
		end


	TWO_POTENCY_TEST_1
			-- pair value but not power of 2
		local
			cell : CELL_2048
		do
			create cell.make
			assert ("18 is not power of 2", not (cell.two_potency (18)))
		end
	TWO_POTENCY_TEST_2
			-- odd value
		local
			cell : CELL_2048
		do
			create cell.make
			assert ("27 is not power of 2", not(cell.two_potency (27)))
		end

	TWO_POTENCY_TEST_3
			--
		local
			cell : CELL_2048
		do
			create cell.make
			assert ("1 is power of 2", cell.two_potency (1))
		end

	TWO_POTENCY_TEST_4
			--
		local
			cell : CELL_2048
		do
			create cell.make
			assert ("16 is power  of 2", cell.two_potency (16))
		end


end


