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
			ok, second_time, res : BOOLEAN
		do
			if not second_time then
				ok := True
				create user.make_with_nickname ("user1")
				user.set_nickname ("123456")
				res := user.has_unfinished_game
				ok := False
			end
			assert ("'123456' is not a valid nickname, this test should return false", ok)
			rescue
			second_time := True
			if ok then
				retry
			end



		end

	has_unfinished_game_with_a_valid_nickname_and_saved_game
			-- has_unfinished_game testing with valid nickname and unfinished game. This routine should return true
		local
			user : USER_2048
			game : BOARD_2048
		do
			create user.make_with_nickname ("user2")
			create game.make
			user.save_game (game)
			assert ("'user2' is a valid nickname and has an unfinished game, this test should return true", user.has_unfinished_game)
		end

	has_unfinished_game_with_a_valid_nickname_and_unsaved_game
			-- has_unfinished_game testing with valid nickname without saved game. This routine should return false
		local
			user : USER_2048
			game : BOARD_2048
		do
			create user.make_with_nickname ("user3")
			create game.make
			assert ("'user3' is a valid nickname but has no game unfinished, this test should return false", not user.has_unfinished_game)
		end

end


