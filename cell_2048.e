note
	description: "Summary description for {CELL_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELL_2048

create
	make, make_with_value

feature {ANY}
	value: INTEGER

feature {ANY} -- Initialization
	make
		-- Create a new cell with default value
		do
			value := 0
		end

	make_with_value(new_val: INTEGER)
		-- Create a new cell with determinate value
		require
			two_potency_and_not_1: new_val>=0 and (new_val /= 1) -- Two potency condition not implemented
		do
			value := new_val
		ensure
			value_set: value = new_val
		end

end
