note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "adriangalfioni"
	date: "25-08-14"
	revision: "$Revision$"
	testing: "type/manual"

class
	IS_POWER_OF_TWO_AT_CELL_2048

inherit
	EQA_TEST_SET


feature -- Rutine is_power_of_two in cell_2048 class tests


	power_of_two_test_with_two_potency_value
			-- Test power_of_two with two potency value
			-- Must return TRUE
		local
			cell: CELL_2048
		do
			create cell.make
			assert ("Two is power of two", cell.is_power_of_two(2))
		end


	power_of_two_test_with_not_two_potency_value
			-- Test power_of_two with not two potency value
			-- Must return FALSE
		local
			cell: CELL_2048
		do
			create cell.make
			assert ("Two is power of two", not cell.is_power_of_two(7))
		end


	power_of_two_test_with_one
			-- Test power_of_two with one
			-- Must return TRUE
		local
			cell: CELL_2048
		do
			create cell.make
			assert ("Two is power of two", cell.is_power_of_two(1))
		end


	power_of_two_test_with_zero
			-- Test power_of_two with zero
			-- Must return FALSE
		local
			cell: CELL_2048
		do
			create cell.make
			assert ("Two is power of two", cell.is_power_of_two(0))
		end


	power_of_two_negative_test
			-- power_of_two ontract´s test
		local
  			ok, try, second_time: BOOLEAN
  			cell: CELL_2048
		do
			create cell.make
    		if not second_time then
          		ok := True
          		try:=cell.is_power_of_two(-2)
          		ok := False -- If didnt throw an exception something is wrong
    		end
    		assert ("Rutine must fail", ok)
		rescue
     		second_time := True
     		if ok then   -- If ok rutine failed
           		retry
     		end
		end


end


