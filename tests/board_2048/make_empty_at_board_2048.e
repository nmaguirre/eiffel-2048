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

	creation_test_make_empty
		local
			board : BOARD_2048
		do
			create board.make_empty
			assert("Size Element == 16",board.elements.count = 16)
		end

end
