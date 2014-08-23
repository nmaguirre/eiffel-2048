note
	description: "This class implements the tests for the methods in class CONTROLLER_2048"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_CONTROLLER_2048

inherit
	EQA_TEST_SET

feature --Test routines

	TEST_DEFAULT_CONSTRUCTOR
		-- Creation test with default constructor
		local
			controller : CONTROLLER_2048
			correct_dimensions : BOOLEAN
		do
			controller.make
			correct_dimensions := controller.board.elements.width=4 and controller.board.elements.height=4
			assert("The board has the correct dimensions",correct_dimensions)
			assert("Only two filled cells", controller.board.nr_of_filled_cells=2)
		end
end
