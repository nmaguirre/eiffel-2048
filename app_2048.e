note
	description: "eiffel-2048 application root class, for command line version of the application."
	date: "August 25, 2014"
	revision: "0.01"

class
	APP_2048

inherit

	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			print ("Game Eiffel-2048 not fully implemented yet!%N")
		end

feature -- Implementation

	controller: CONTROLLER_2048
			-- It takes care of the control of the 2048 game.

end
