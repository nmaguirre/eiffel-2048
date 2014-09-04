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
		require
			controller /= void and user /= void and not(controller.is_finished)
		local
			quit_game: BOOLEAN
		do
			from
				quit_game := False
			until
				quit_game
			loop
				print ("|--------2048--------|%N")
				print ("|                    |%N")
				print ("|        MENU        |%N")
				print ("|                    |%N")
				print ("|q : QUIT AND SAVE   |%N")
				print ("|a : LEFT            |%N")
				print ("|d : RIGHT           |%N")
				print ("|w : UP              |%N")
				print ("|s : DOWN            |%N")
				print ("|--------------------|%N")
				io.putstring (controller.board.out)
				from
				until
					controller.is_finished or io.last_character.is_equal ('q')
				loop
						--read character
					io.read_character
						--move left
					if io.last_character.is_equal ('a') then
						if controller.board.can_move_left then
							controller.left
								--update board
							io.put_string (controller.board.out)
						end
					end
						--move down
					if io.last_character.is_equal ('s') then
						if controller.board.can_move_down then
							controller.down
								--update board
							io.put_string (controller.board.out)
						end
					end
						--move right
					if io.last_character.is_equal ('d') then
						if controller.board.can_move_right then
							controller.right
								--update board
							io.put_string (controller.board.out)
						end
					end
						--move up
					if io.last_character.is_equal ('w') then
						if controller.board.can_move_up then
							controller.up
								--update board
							io.put_string (controller.board.out)
						end
					end
						--exit

				end
					--finish game
				if controller.is_finished then
					if controller.board.is_winning_board then
						print ("CONGRATULATIONS!!!!!!! YOU WON!!!!!!!! :D")
					else
						print ("you lost :'( ")
					end
					print ("%N")
					print ("|--------2048--------|%N")
					print ("|                    |%N")
					print ("|        MENU        |%N")
					print ("|                    |%N")
					print ("|q : QUIT GAME       |%N")
					print ("|n : NEW GAME        |%N")
					print ("|--------------------|%N")
					--read character
					io.read_character
					if io.last_character.is_equal ('q') then
						quit_game := True
					end
					-- restart of play per game completed.
					controller.board.make
				else
					print ("q pressed, exit game")
					quit_game := True
				end
			end
			-- Save game
			user.save_game (controller.board)
		end

feature -- Implementation

	controller: CONTROLLER_2048
			-- It takes care of the control of the 2048 game.

	user: USER_2048
			-- it represents the current game session

end
