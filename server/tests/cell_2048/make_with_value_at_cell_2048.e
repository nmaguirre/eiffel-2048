note
	description: "Test class for routine make_with_value at CELL_2048"
	author: "agusbauer"
	date: "August 26, 2014"
	revision: "0.01"

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

	creation_negative_test_constructor_with_value_1
			-- Creation test with non two power number
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


	creation_negative_test_constructor_with_value_2
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


end
