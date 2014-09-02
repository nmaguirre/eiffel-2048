note
	description: "Summary description for {USER_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	USER_2048


create
	make_new_user, make_existant_user, make_with_nickname, make_with_nick_and_pass

feature -- Initialisation

	make_existant_user(existant_name, existant_surname, existant_nickname, existant_password: STRING; existant_game: BOARD_2048)
	require
		is_valid_name(existant_name)
		is_valid_password(existant_password)
		is_valid_nickname(existant_nickname)
	do
		name:=name
		surname:=existant_surname
		nickname:=existant_nickname
		password:=existant_password


	end


	make_new_user(new_name, new_surname, new_nickname, new_password: STRING)
	require
		is_valid_name(new_name)
		is_valid_password(new_password)
		is_valid_nickname(new_nickname)
	local
		new_board: BOARD_2048
	do
		name:=new_name
		surname:=new_surname
		nickname:=new_nickname
		password:=new_password

		game.make

	end

	make_with_nickname(nick: STRING)
	require
		is_valid_nickname(nick)
	do
		nickname:=nick
	end


	make_with_nick_and_pass(nick, pass: STRING)
	require
		is_valid_password(pass)
		is_valid_nickname(nick)
	do
		nickname:=nick
		password:=pass
	end



feature -- Status report
	name: STRING
	surname:STRING
	nickname: STRING
	password: STRING

	game : BOARD_2048

	has_unfinished_game : BOOLEAN
	do

	end

feature -- Status setting

	save_game (new_game: BOARD_2048)
	do

	end

	load_game
		-- Load a saved_game
	do
--		if attached {USER_2048} retrieve_by_name("/.saved_games/"+nickname) as user_file then
--			name := user_file.name
--			surname := user_file.surname
--			password := user_file.password
--			game := user_file.game
--		end
	end

feature -- Control methods

	is_valid_name(name_control: STRING): BOOLEAN
	do
		if
			not name_control.is_empty or name.at (1).is_alpha
		then
			Result:=TRUE
		end
	end


	is_valid_password(pass_control: STRING): BOOLEAN
	do
		if
			not pass_control.is_empty
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


end
