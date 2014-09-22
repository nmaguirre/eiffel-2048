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
			-- String out lenght must be even
			-- Must return TRUE
		local
			board: BOARD_2048
		do
			create board.make_empty
			assert ("String has even characters", board.out.count\\2=0)
		end

	string_is_not_empty
			-- String out of a new board shouldn't be empty
			-- Must return TRUE
		local
			board: BOARD_2048
		do
			create board.make_empty
			assert ("String is not empty", board.out.count/=0)
		end

	string_has_2_or_4
			-- Board.out shall contain either two 2, two 4 or one each.
			-- Must return TRUE
		local
			board: BOARD_2048
			res: INTEGER
		do
			create board.make
			res := board.out.occurrences ('2')+board.out.occurrences ('4')
			assert ("Board.out contains either two 2, two 4 or a 2 and a 4", res = 2)
		end

end
