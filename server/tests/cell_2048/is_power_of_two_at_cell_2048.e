note
	description: "Test class for routine is_power_of_two at CELL_2048"
	author: "adriangalfioni"
	date: "August 26, 2014"
	revision: "0.02"

class
	IS_POWER_OF_TWO_AT_CELL_2048

inherit
	EQA_TEST_SET


feature -- Rutine is_power_of_two at CELL_2048 class tests


	power_of_two_test_with_two
			-- Test power_of_two with two
			-- Must return TRUE
		local
			cell: CELL_2048
		do
			create cell.make
			assert ("Two is power of two", cell.is_power_of_two(2))
		end


	power_of_two_test_with_seven
			-- Test power_of_two with seven
			-- Must return FALSE
		local
			cell: CELL_2048
		do
			create cell.make
			assert ("Seven is not power of two", not cell.is_power_of_two(7))
		end


	power_of_two_test_with_one
			-- Test power_of_two with one
			-- Must return TRUE
		local
			cell: CELL_2048
		do
			create cell.make
			assert ("One is power of two", cell.is_power_of_two(1))
		end


	power_of_two_test_with_zero
			-- Test power_of_two with zero
		local
			cell: CELL_2048
			ok, second_time, exception_raiser : BOOLEAN
		do
			if not second_time then
          		ok := True
          		create cell.make
          		exception_raiser := cell.is_power_of_two (0) -- Should raise an exception.
          		ok := False
    		end
    		assert ("The rutine has to fail", ok)
		rescue
     		second_time := True
     		if ok then   -- ok = true means that the routine failed
           		retry
    		end
		end


	power_of_two_test_with_negative_number
			-- Test power_of_two with negative number
		local
			cell: CELL_2048
			ok, second_time, exception_raiser : BOOLEAN
		do
			if not second_time then
          		ok := True
          		create cell.make
          		exception_raiser := cell.is_power_of_two (-1) -- Should raise an exception.
          		ok := False
    		end
    		assert ("The rutine has to fail", ok)
		rescue
     		second_time := True
     		if ok then   -- ok = true means that the routine failed
           		retry
    		end
		end

end


