note
	description: "Summary description for {TEST_BOARD_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_BOARD_2048

inherit
	EQA_TEST_SET

	feature -- Test constructors

	CREATION_TEST_CONTRUCTOR_EMPTY
			-- Creation test with default constructor
		local
			board : BOARD_2048

		do
			create board.make_empty
			assert ("The new board has yours atributes with default values ", board.columns = 0 and board.lines = 0 and board.elements = Void)
		end

	CREATION_TEST_CONTRUCTOR_WHIT_PARAMETERS
			-- Creation test with parameters
		local
			board : BOARD_2048
			x,y : INTEGER

		do
			x:= 4
			y:= 4
			create board.make(x,y)
			assert ("The new board has yours atributes with parameters values ", board.columns = 4 and board.lines = 4 and board.elements /= Void)
		end

		CREATION_TEST_CONTRUCTOR_WHIT_WRONG_PARAMETERS
			-- Creation test with wrong parameters
		local
			board : BOARD_2048
			x,y : INTEGER
			second_time, ok : BOOLEAN

		do
			if not second_time then
				ok := True
				x:= 3
				y:= 3
				create board.make(x,y)
				ok := False
			end
			assert ("routine failed, as expected", ok)
		rescue
			second_time := True
			if ok then
				retry
			end
		end

	feature --test routines

		TEST_SET_CELL
			--  test set_cell feature
		local
			board : BOARD_2048

		do
			create board.make(4,4)
			board.set_cell (2, 2, 2)
			assert ("The set_cell feature update the board", board.elements.item (2,2) = 2)
		end


		TEST_NR_OF_FILLED_CELLS
			-- test nr_of_filled_cells feature
			local
			board : BOARD_2048

		do
			create board.make_empty
			assert ("The numbers of filled cells is 0 using the make_empty constructor ", board.nr_of_filled_cells = 0)
		end

		TEST_NR_OF_FILLED_CELLS_2
			-- test nr_of_filled_cells feature
			local
			board : BOARD_2048

		do
			create board.make(4,4)
			assert ("The numbers of filled cells is 2 using the make constructor with correct parameters", board.nr_of_filled_cells = 2)
		end

end
