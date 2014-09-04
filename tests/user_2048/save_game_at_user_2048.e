note
	description: "[
		Tests for the save_game feature at the USER_2048 class
	]"
	author: "jheredia"
	date: "September 3, 2014"
	revision: "0.01"
	testing: "type/manual"

class
	SAVE_GAME_AT_USER_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	save_game_with_void_board
			-- Attempt to save_game with a void board
			-- Should raise an exception.
		local
			user: USER_2048
			board: BOARD_2048
			second_time, ok: BOOLEAN
		do
			create user.make_with_nickname ("johndoe")
			if not second_time then
				ok := True
				user.save_game (board)
				ok := False
			end
			assert ("You can't save a void board.", ok)
			rescue
			second_time := True
			if ok then
				retry
			end
		end

	save_game_with_non_void_board
		-- Saves a file with a generated board
		-- Should return true
		local
			user, x: USER_2048
			bool : BOOLEAN
			obj : ANY
			board: BOARD_2048
		do
			create user.make_with_nickname ("johndoe")
			create board.make
			board.set_cell (1, 2, 4)
			user.save_game (board)
			obj := user.retrieve_by_name (".saved_games/johndoe")
			if attached {USER_2048} (obj) as aux then
				x := aux
			end
			assert ("This test should pass", x /= void)
		end
end


