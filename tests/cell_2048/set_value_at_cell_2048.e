note
	description: "Test class for routine set_value at CELL_2048"
	author: "alangonzalez93"
	date: "August 26 2014"
	revision: "0.01"

class
	SET_VALUE_AT_CELL_2048

inherit

	EQA_TEST_SET

feature

	set_value_test_with_correct_value_equals_2
	--Test this method with value = 2
		local
			cell: CELL_2048
		do
			create cell.make
			cell.set_value (2)
			assert ("cell value should be 2", cell.value = 2)
		end

	set_value_test_with_correct_value_equals_1024
	--Test this method with value = 1024
		local
			cell: CELL_2048
		do
			create cell.make
			cell.set_value (1024)
			assert ("cell value should be 1028", cell.value = 1024)
		end

	set_value_test_with_wrong_value_equals_1999
	--Test this method with value = 1999
		local
			ok, second_time : BOOLEAN
			cell : CELL_2048
		do
			if not second_time then
				ok := True;
				create cell.make
				cell.set_value (1999) -- Must throw an exception
				ok := False;
			end
			assert("routine failed, as expected",ok)
		rescue
			second_time := True;
			if ok then  -- ok = True means that the rutine failed
				retry
			end
		end

	set_value_test_with_wrong_value_equals_500
	--Test this method with value = 500
		local
			ok, second_time : BOOLEAN
			cell : CELL_2048
		do
			if not second_time then
				ok := True;
				create cell.make
				cell.set_value (500) -- Must throw an exception
				ok := False;
			end
			assert("routine failed, as expected",ok)
		rescue
			second_time := True;
			if ok then  -- ok = True means that the rutine failed
				retry
			end
		end

end
