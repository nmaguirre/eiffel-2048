note
	description: "[
		Tests for the method load_game of class USER_2048
	]"
	author: "facumolina - aechaves"
	date: "$September 3, 2014$"
	revision: "$0.01$"
	testing: "type/manual"

class
	LOAD_GAME_AT_USER_2048

inherit
	EQA_TEST_SET

feature -- Test routines

	load_game_nonexistent_user_test
			-- test for nonexistent user should raise an exception
		local
			user : USER_2048
			ok, second_time : BOOLEAN
		do
			if not second_time then
				ok := True
				create user.make_with_nickname ("nonexistent_user")
				user.load_game
				ok := False
			end
			assert ("The routine has to fail", ok)
		rescue
			second_time := True
			if ok then
				retry
			end
		end

	load_game_existent_user

		local
			user : USER_2048
			game : BOARD_2048
		do
			create user.make_new_user ("user_name", "user_surname", "user_nickname", "user_pwd")
			create game.make_empty
			game.set_cell (1,1,4)
			game.set_cell (1,2,8)
			user.save_game (game)
			user.load_game
			-- Correct atributtes
			assert("The name is correct", user.name="user_name")
			assert("The surname is correct", user.surname="user_surname")
			assert("The nickname is correct", user.nickname="user_nickname")
			assert("The password is correct", user.password="user_pwd")
			-- Correct board
			assert("Correct cell 1", user.game.elements.item (1, 1).value=4)
			assert("Correct cell 2", user.game.elements.item (1, 2).value=8)
		end

end


