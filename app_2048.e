note
	description: "eiffel-2048 application root class, for command line version of the application."
	date: "August 26, 2014"
	revision: "0.01"

class
	APP_2048

inherit

	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make -- Run application.
		do
			login_screen
			play
		end

feature -- Login

	login_screen
			-- read the user name and password
			-- create a new user or validate the datas (call login)
		do
		end

	login (username: STRING; password: STRING)
			-- validate the user datas
			-- load the user from the file into the user variable, or void if the user doesn't exist
		require
			username /= Void and password /= Void
		local
			possible_user: USER_2048
		do
			create possible_user.make_with_nickname (username)
			if possible_user.has_unfinished_game then
				possible_user.load_game
				if password = possible_user.password then
					user := possible_user
				else
					user := Void
				end
			else
				user := Void
			end
		end

feature --game

	play
			-- play the game with the current session
			-- it allows the user to save the current game session
			-- IMPORTANT: after saving the game, the game finished.
			-- IMPORTANT: if the user has a saved session, then it cannot start a new game.
			--            It should finished the previous game first.
		do
		end

feature -- Implementation

	controller: CONTROLLER_2048
			-- It takes care of the control of the 2048 game.

	user: USER_2048
			-- it represents the current game session

end
