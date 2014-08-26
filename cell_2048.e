note
	description: "Class that represents a cell of a 2048 board."
	author: ""
	date: "August 25, 2014"
	revision: "0.01"

class
	CELL_2048

inherit

	ANY
		redefine
			out
		end

create
	make, make_with_value

feature {ANY} -- Status report

	value: INTEGER
			-- Returns the value stored in the cell
			-- When the value is zero, it means that the
			-- cell is not set.
			-- Value should otherwise be a power of two (greater than one)

	out: STRING
			-- Provides a string representation of a cell (shows its value as a string)

feature {ANY} -- Initialization

	make
			-- Create a new cell with default value
			-- Cell should be unset
		do
			value := 0
		ensure
			value = 0
		end

	make_with_value (new_val: INTEGER)
			-- creates a cell initialized with a user-provided value

		require
			is_valid_value (new_val)
		do
			value := new_val
		ensure
			value_set: value = new_val
		end

feature {ANY} -- Status setting

	set_value (new_value: INTEGER)
			-- Update the value of a cell with new_value
		require
			is_valid_value (new_value)
		do
			value := new_value
		ensure
			value = new_value
		end

feature {ANY} -- Miscellaneous

	is_valid_value (val: INTEGER): BOOLEAN
			-- Returns true if value is either 0, or a power of two
			-- greater than 1.
		do
				--If the value it's greater than 1 then checks if it's a power of two.
			if val > 1 then
					--If value is power of two, returns True
				if is_power_of_two (val) then
					Result := True
				end
			end
				--Else, if the value it's 0 then returns True
			if val = 0 then
				Result := True
			end
				--If value is either negative or 1, Result remains False.
		ensure
			Result = (val = 0 or (val > 1 and is_power_of_two (val)))
		end

	is_power_of_two (val: INTEGER): BOOLEAN
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

	is_available: BOOLEAN
			--Returns true if a cell is available, that is that value is 0.
		do
			Result := (value = 0)
		ensure
			Result = (value = 0)
		end

invariant
		--a cell must have either zero, or a value that is a power of two greater than 1
	value >= 0 and is_power_of_two (value) = True and value /= 1

end
