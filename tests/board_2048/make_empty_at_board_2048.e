note
	description: "Test class for routine make_empty at BOARD_2048."
	author: "jpadula"
	date: "August 28, 2014"
	revision: "0.01"

class
	MAKE_EMPTY_AT_BOARD_2048

inherit
	EQA_TEST_SET

feature

	make_empty_qty_columns_correct
		local
			board : BOARD_2048
		do
			create board.make_empty
			assert("QTY Columns correct",board.elements.width = 4)
		end

	make_empty_qty_rows_correct
		local
			board : BOARD_2048
		do
			create board.make_empty
			assert("QTY Rows correct",board.elements.height = 4)
		end

	make_empty_all_are_default_values
		local
			board: BOARD_2048
		do
			create board.make_empty
			assert("All default values", board.all_default (board.elements))
		end


end
