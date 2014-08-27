note
	description: "Test of the make constructor in class CONTROLLER_2048."
	author: "ggiovannini"
	date: "August 26, 2014"
	revision: "0.01"

class
	MAKE_AT_CONTROLLER_2048

inherit

	EQA_TEST_SET

feature -- Test routines

	test_game_not_finished
			-- Test to verify that the game is not finished at the beginning
		local
			controller: CONTROLLER_2048
		do
			create controller.make
			assert ("is_finished must be false", not controller.is_finished)
		end

	last_random_cell_coordinates_value_default
			-- verifying that the test cell coordinates are (0,0)
		local
			controller: CONTROLLER_2048
		do
			create controller.make
			assert ("cell coordinates are (0,0)", (controller.coord_last_random_cell.at (1) = 0) and (controller.coord_last_random_cell.at (2) = 0))
		end

	test_initialized_board
			-- Test to verify that the board is initialized
		local
			controller: CONTROLLER_2048
		do
			create controller.make
			assert ("board is non-void", controller.board /= Void)
		end

end
