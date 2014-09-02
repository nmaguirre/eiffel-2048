note
	description: "Summary description for {USER_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	USER_2048

create
	make_new_user, make_existant_user

feature -- Initialisation

	make_existant_user(existant_name:STRING, existant_surname: STRING, existant_nickname: STRING, existant_password: STRING, existant_game: BOARD_2048)
	require
		is_valid_name(existant_name)
		is_valid_password(existant_password)
		is_valid_nickname(existant_nickname)
	do
		name:=name
		surname:=existant_surname
		nickname:=existant_nickname
		password:=existant_password

		has_unfinished_game:= TRUE
	end


	make_new_user(new_name:STRING, new_surname: STRING, new_nickname: STRING, new_password: STRING)
	local
		new_board: BOARD_2048
	require
		is_valid_name(existant_name)
		is_valid_password(existant_password)
		is_valid_nickname(existant_nickname)
	do
		name:=new_name
		surname:=new_surname
		nickname:=new_nickname
		password:=new_password

		game:= new_board.make
		has_unfinished_game:= TRUE
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

feature -- Control methods

	is_valid_name(name: STRING): BOOLEAN
	do
		if
			not name.is_empty or name.at (1).is_alpha
		then
			Result:=TRUE
		end
	end


	is_valid_password(pass: STRING): BOOLEAN
	do
		if
			not pass.is_empty
		then
			Result:=TRUE
		end
	end


	is_valid_nickname(nickname: STRING): BOOLEAN
	do
		if
			not nickname.is_empty or name.at (1).is_alpha
		then
			Result:=TRUE
		end
	end


end
