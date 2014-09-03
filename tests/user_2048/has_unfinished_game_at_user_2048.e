note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	HAS_UNFINISHED_GAME_AT_USER_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	has_unfinished_game_with_invalid_nickname
			-- has_unfinished_game testing with invalid nickname. It should break precondition
		local
			user : USER_2048
			res : BOOLEAN
		do
			--implement this test
			assert ("not_implemented", False)
		end

	has_unfinished_game_with_a_valid_nickname_and_saved_game
			-- New test routine
		local
			user : USER_2048
			res : BOOLEAN
		do
			--implement this test
			assert ("not_implemented", False)
		end

	has_unfinished_game_with_a_valid_nickname_and_unsaved_game
			-- New test routine
		local
			user : USER_2048
			res : BOOLEAN
		do
			--implement this test
			assert ("not_implemented", False)
		end

end


