note
	description: "Summary description for {BOARD_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD_2048

create
	make, make_empty

feature {ANY}

	elements: ARRAY2 [CELL_2048]

feature

		--dimensions

	lines: INTEGER

	columns: INTEGER

	make_empty
		-- Creates an empty board (all cells with default value)
		local
			default_cell: CELL_2048
		do
			create default_cell.make
			create elements.make_filled (default_cell, 4, 4)
		end

		-- Board Constructor

	make (n, m: INTEGER)
			-- Create a matrix with n x m dimensions, with all elements initialized with the default value of T

		require
			positive: n = 4 and m = 4
		local
			i: INTEGER
		do
		ensure
			dimensions: lines = n and columns = m
		end

feature

	set_cell (row: INTEGER; col: INTEGER; value: INTEGER)
			-- Set cell in [row,col] position with a determinate value
		require
			(row >= 0 and row < 4) and (col >= 0 and col < 4) and elements.item (row, col).two_potency (value) and value >=0 and value >=1
		do
			elements.item (row, col).set_value (value)
		ensure
			elements.item (row, col).two_potency (value) and elements.item (row, col).value >=0 and elements.item (row, col).value >=1
		end

	initialise
		local
			i, j, a, b: INTEGER
		do
			from
				i := generatePosition
				j := generatePosition
			until
				elements.item (i, j).get_value = 0
			loop
				i := generatePosition
				j := generatePosition
			end
			a := generateValue
			b := generateValue
			elements.item (i, j).set_value (a)
			from
				i := generatePosition
				j := generatePosition
			until
				elements.item (i, j).get_value = 0
			loop
				i := generatePosition
				j := generatePosition
			end
			elements.item (i, j).set_value (b)
		end

	generatePosition: INTEGER
		local
			a: INTEGER
			random: RANDOM
			seconds: C_DATE
		do
			create random.make
			create seconds.default_create
			random.set_seed (seconds.second_now)
			a := (random.next_random (seconds.second_now) \\ 100)
			if a < 25 then
				a := 1
			end
			if (a > 25 and a < 50) then
				a := 2
			end
			if (a > 50 and a < 75) then
				a := 3
			end
			if (a > 75 and a < 100) then
				a := 4
			end
			Result := a
		end

	generateValue: INTEGER
		local
			a: INTEGER
			random: RANDOM
			seconds: C_DATE
		do
			create random.make
			create seconds.default_create
			random.set_seed (seconds.second_now)
			a := (random.next_random (seconds.second_now) \\ 100)
			if a < 50 then
				Result := 2
			else
				Result := 4
			end
		end

feature -- Status report

	nr_of_filled_cells: INTEGER

end
