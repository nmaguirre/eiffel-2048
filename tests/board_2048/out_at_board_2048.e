note
	description: "Summary description for {OUT_AT_BOARD_2048}."
	author: "javieriocejo"
	date: "August 27, 2014"
	revision: "00.1"

class
	OUT_AT_BOARD_2048

inherit
	EQA_TEST_SET


feature -- Rutine is_power_of_two at CELL_2048 class tests


	string_has_even_amount_of_numbers
			-- symbols
			-- Must return TRUE
		local
			board: BOARD_2048
		do
			create board.make_empty
			assert ("String has even characters", board.out.count\\2=0)
		end

end
