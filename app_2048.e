note
	description : "eiffel-2048 application root class"
	date        : "$Date$"
	revision    : "$Revision$"

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

end
