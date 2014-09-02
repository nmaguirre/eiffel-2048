note
	description: "Summary description for {USER_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	USER_2048

create

feature -- Initialisation

	make
	do

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


end
