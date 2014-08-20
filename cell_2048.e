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
			two_potency(new_val) and (new_val>=0) and (new_val /= 1) -- Two potency condition not implemented
		do
			value := new_val
		ensure
			value_set: value = new_val
		end


	two_potency(val:INTEGER):BOOLEAN
		-- Returns True if val is power of 2
	require
		val >= 0
	local
		i:INTEGER
		potency: BOOLEAN

	do

		from
			potency := True
			i := val
		until
			i <=1 or not potency
		loop
			if i\\2 /= 0 then
				potency := False
			end
			i := i//2
		end
		Result := potency

	end



end
