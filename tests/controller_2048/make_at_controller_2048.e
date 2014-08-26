note
	description: "Summary description for {MAKE_AT_CONTROLLER_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

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
			assert ("is_finished must be false", controller.is_finished = False)
		end


	last_random_cell_coordinates_value_default
		-- verifying that the test cell coordinates are (0,0)
		local
			controller: CONTROLLER_2048
		do
			create controller.make
			assert ("cell coordinates are (0,0)", (controller.last_random_cell_coordinates.at (1) = 0) and
												 (controller.last_random_cell_coordinates.at (2) = 0) )
		end

		test_initialized_board
			-- Test to verify that the board is initialized
			local
				controller: CONTROLLER_2048
			do
				create controller.make
				assert ("board is non-void", controller.board /= Void )
			end

end
