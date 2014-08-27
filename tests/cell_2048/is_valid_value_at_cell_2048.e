note
	description: "[
		Tests for "is_valid_value" feature at "CELL_2048" class.
	]"
	author: "Jheredia"
	date: "August 26, 2014"
	revision: "0.02"
	testing: "type/manual"

class
	IS_VALID_VALUE_AT_CELL_2048

inherit

	EQA_TEST_SET

feature -- Test routines

	is_valid_value_test_with_1
			-- Test this method with value = 1
			-- Should return False
		local
			ivv: CELL_2048
		do
			create ivv.make
			assert ("1 is not a valid value, this test should return false", not ivv.is_valid_value (1))
		end

	is_valid_value_test_with_2
			-- Tests this method with value = 2
			-- Should return True
		local
			ivv: CELL_2048
		do
			create ivv.make
			assert ("2 is a valid value, this test should return true", ivv.is_valid_value (2))
		end

	is_valid_value_test_with_0
			-- Tests this method with value = 0
			-- Should return True
		local
			ivv: CELL_2048
		do
			create ivv.make
			assert ("0 is a valid value, this test should return true", ivv.is_valid_value (0))
		end

	is_valid_value_test_with_negative_value
			-- Tests this method with value = -1
			-- Should fail as this method doesn't accept negative integers as input
		local
			ivv: CELL_2048
		do
			create ivv.make
			assert ("A negative value isn't a valid value, this test should return false", not ivv.is_valid_value (-1))
		end

end
