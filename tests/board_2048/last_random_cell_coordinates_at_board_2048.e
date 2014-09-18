note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	LAST_RANDOM_CELL_COORDINATES_AT_BOARD_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	test_last_random_cell_coordinates_make
	-- test the function with make constructor
		local
			b: BOARD_2048
		do
			create b.make
			assert ("Test with make constructor", b.coord_last_random_cell /= Void)
		end

	test_last_random_cell_coordinates_make_empty
	-- test the function with make_empty constructor
		local
			b: BOARD_2048
		do
			create b.make_empty
			assert("Test with make_empty constructor", b.coord_last_random_cell = Void)
		end

	test_last_random_cell_coordinates_magic
	-- test the function with one movement
		local
			b: BOARD_2048
		do
			create b.make
			b.down
			assert("Test with make constructor and one move", b.coord_last_random_cell /= Void)
		end

end


