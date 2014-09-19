note
	description: "Summary description for {USER_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	USER_2048
inherit
	STORABLE

create
	make_new_user, make_existant_user, make_with_nickname, make_with_nick_and_pass, make_for_test

feature -- Initialisation

	make_existant_user(existant_name, existant_surname, existant_nickname, existant_password: STRING; existant_game: BOARD_2048)
		-- Create a new user with existant user status
	require
		is_valid_name(existant_name)
		is_valid_password(existant_password)
		is_valid_name(existant_nickname)
	do
		name:=existant_name
		surname:=existant_surname
		nickname:=existant_nickname
		password:=existant_password

		game := existant_game
	end


	make_new_user(new_name, new_surname, new_nickname, new_password: STRING)
		-- Create a new user with all atributes
	require
		is_valid_name(new_name)
		is_valid_password(new_password)
		is_valid_name(new_nickname)
	do
		name:=new_name
		surname:=new_surname
		nickname:=new_nickname
		password:=new_password

		create game.make

	end

	make_with_nickname(nick: STRING)
		-- Create a new user with nickname atribute
	require
		is_valid_name(nick)
	do
		nickname:=nick
	end


	make_with_nick_and_pass(nick, pass: STRING)
		-- Create a new user with nickname and password atribute
	require
		is_valid_password(pass)
		is_valid_name(nick)
	do
		nickname:=nick
		password:=pass
	end

feature {IS_VALID_NAME_AT_USER_2048, APP_2048}

	make_for_test()
		-- This method allows to create a User withtout any restriction on the imputs
		-- For testing purpouse
	do
	end

feature -- Status report
	name: STRING
	surname:STRING
	nickname: STRING
		-- name under which the file is stored persistent game

	password: STRING

	game : BOARD_2048

	path_saved_games : STRING
            -- Returns the path to the folder containing saved games
        once
            Result := ".saved_games/"
        end

	has_unfinished_game : BOOLEAN
		-- Returns true if the user has an unfinished game	
	require
		valid_nickname: is_valid_name(nickname)
	local
		file : RAW_FILE
	do
		create file.make_with_name (path_saved_games+nickname)
			if file.exists and then file.is_readable then
				Result := True
			end
	end

feature -- Status setting

	--Saves the state of the current game board corresponding to this user
	--Requires that "new_game" is not void.
	save_game (new_game: BOARD_2048)
	require
		new_game /= void
	do
		game := new_game
		store_by_name(path_saved_games+nickname)
	ensure
		game = new_game
	end

	load_game
		-- Load a saved_game
	require
		existing_file(nickname)
	do
		if attached {USER_2048} retrieve_by_name(path_saved_games+nickname) as user_file then
			name := user_file.name
			surname := user_file.surname
			password := user_file.password
			game := user_file.game
		end
	ensure
		(name /= Void) and (surname /= Void) and (password /= Void) and (game /= Void)
	end

feature -- Control methods

	is_valid_name(name_control: STRING): BOOLEAN
		-- Validate if name isnt void, empty or starts with a number
	do
		if
			(name_control /= Void) and (not name_control.is_equal ("")) and (name_control.at (1).is_alpha)
		then
			Result:=TRUE
		end
	end


	is_valid_password(pass_control: STRING): BOOLEAN
		-- Validate if pass isnt void or empty
	do
		if
			(pass_control /= Void) and (not pass_control.is_equal (""))
		then
			Result:=TRUE
		end
	end



	is_valid_nickname(nickname_control: STRING): BOOLEAN
	do
		if
			not nickname_control.is_empty or name.at (1).is_alpha
		then
			Result:=TRUE
		end
	end

	existing_file(nickname_control: STRING): BOOLEAN
		-- Check if file exists
	do
		if attached retrieve_by_name(path_saved_games+nickname_control) as file then
			Result := True
		else
			Result := False
		end
	end

feature{HAS_UNFINISHED_GAME_AT_USER_2048}

	set_nickname(nick : STRING)
		--
	do
		nickname:= nick
	end

end
