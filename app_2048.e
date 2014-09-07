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
			user.load_game
			play
		end

feature -- Login

	login_screen
			-- read the user name and password
			-- create a new user or validate the datas (call login)

		local
			nickname, password : STRING
			user_created : BOOLEAN
		do
			from

			until
				user_created
			loop
				io.put_new_line --Main menu
				io.put_string ("Choose your destiny! %N")
				io.put_string ("Press 1 to register as a new user %N")
				io.put_string ("Press 2 to login %N")
				io.read_natural
				if io.last_natural = 1 then -- Create new user menu
					create_user_screen
					user_created := True
				else
					if io.last_natural = 2 then -- Login menu
						io.put_string ("Login %N")
						io.put_string ("Insert your nickname %N")
						io.read_line
						nickname := io.last_string
						io.put_string ("Insert your password %N")
						io.read_line
						password := io.last_string
						login(nickname,password)
						if user = void then
							io.put_string ("invalid nickname or password %N")
						else
							user_created := True
						end

					end
				end
			end
		ensure
			user /= void
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

feature {NONE} --create user, screen

	create_user_screen
	--Read the user data
	--Create a new user
	local
		valid_data : BOOLEAN
		new_user : USER_2048
		name, surname, nickname, password : STRING
	do
		create new_user.make_for_test
		valid_data := False
		from

		until
			valid_data
		loop --Create a new user, menu
			io.put_new_line
			io.put_string ("Register as a new user %N")
			io.put_string ("Insert your name %N")
			io.read_line
			name := io.last_string
			io.put_string ("Insert your surname %N")
			io.read_line
			surname := io.last_string
			io.put_string ("Insert your nickname %N")
			io.read_line
			nickname := io.last_string
			io.put_string ("Insert your new password %N")
			io.read_line
			password := io.last_string
			if new_user.is_valid_name (name) and new_user.is_valid_name (nickname) and new_user.is_valid_password (password) then --validate the data
				valid_data := True
			else
				io.put_string ("Invalid data, Please ensure to enter the data correctly %N")
			end

		end
			create new_user.make_new_user (name, surname,nickname,password)
			user := new_user
			io.put_string ("User successfully created %N")
	rescue
		io.put_string ("User could not be created, nickname already exists %N")
		retry
	end

feature --game

	play
			-- play the game with the current session
			-- it allows the user to save the current game session
			-- IMPORTANT: after saving the game, the game finished.
			-- IMPORTANT: if the user has a saved session, then it cannot start a new game.
			--            It should finished the previous game first.
		require
			controller /= void and user /= void and not (controller.is_finished)
		do
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
				io.last_character.is_equal ('q')
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
						-- restart of play per game completed.
					controller.board.make
					if io.last_character.is_equal ('n') then
						io.putstring (controller.board.out)
					end
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
