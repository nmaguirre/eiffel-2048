note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	LAST_RANDOM_CELL_COORDINATES_AT_CONTROLLER_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	test_last_random_cell_coordinates_make
	-- test the function with make constructor
		local
			c: CONTROLLER_2048
		do
			create c.make
			assert ("Test with make constructor", c.last_random_cell_coordinates = c.coord_last_random_cell)
		end

	test_last_random_cell_coordinates_make_empty
	-- test the function with make_empty constructor
		local
			b: BOARD_2048
			c: CONTROLLER_2048
		do
			create b.make
			create c.make_with_board (b)
			assert("asdasd", c.last_random_cell_coordinates = c.coord_last_random_cell)
		end

	test_last_random_cell_coordinates_magic
	-- test the function with one movement
		local
			c: CONTROLLER_2048
		do
			create c.make
			c.down
			assert("asdasd", c.last_random_cell_coordinates = c.coord_last_random_cell)
		end

end


