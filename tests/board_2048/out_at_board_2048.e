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

	string_is_not_empty
			-- symbols
			-- Must return TRUE
		local
			board: BOARD_2048
		do
			create board.make_empty
			assert ("String is not empty", board.out.count/=0)
		end

	string_has_2_or_4
			-- symbols
			-- Must return TRUE
		local
			board: BOARD_2048
		do
			create board.make
			assert ("String has 2 of a 4 when created", board.out.has ('2') or board.out.has ('4'))
		end

	string_has_2_or_4_or_else_done
			-- symbols
			-- Must return TRUE
		local
			app: APP_2048
		do
			create app.make

			--just perform some available moves
				app.controller.up
				app.controller.down
				app.controller.left
				app.controller.right
			--then assert the existence of 2 or 4 in the board

			assert ("String has 2 of a 4 when created", app.controller.board.out.has ('2') or app.controller.board.out.has ('4'))
		end





end
