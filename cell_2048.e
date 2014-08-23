note
	description: "Summary description for {CELL_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELL_2048

create
	make, make_with_value

feature {ANY} -- Status report

	value: INTEGER

feature {ANY} -- Initialization

	make
			-- Create a new cell with default value
		do
			value := 0
		end

	make_with_value (new_val: INTEGER)
			-- Create a new cell with determinated value
		require
			two_potency (new_val) and (new_val >= 0) and (new_val /= 1) -- Two potency condition not implemented
		do
			value := new_val
		ensure
			value_set: value = new_val
		end

feature {ANY} -- Status setting

	set_value (new_value: INTEGER)
			-- Update the value of a cell with new_value
		require
			two_potency (new_value) and (new_value >= 0) and (new_value /= 1)
		do
			value := new_value
		ensure
			value = new_value
		end


feature {ANY} -- Miscellaneous

	two_potency (val: INTEGER): BOOLEAN
			-- Returns True if val is power of 2
		require
			val >= 0
		local
			i: INTEGER
			potency: BOOLEAN
		do
			from
				potency := True
				i := val
			until
				i <= 1 or not potency
			loop
				if i \\ 2 /= 0 then
					potency := False
				end
				i := i // 2
			end
			Result := potency
		end

	is_available:BOOLEAN
		--Returns true if value is 0
		require
			value /= Void
		do
			Result:= (value = 0)
		ensure
			value = 0
		end

invariant
		--The created cell must have a positive value that is a potency of two to be a valid cell.
		--This includes 0 (empty cell) as a valid value.
	value >= 0 and two_potency (value) = True and value /= 1

end
