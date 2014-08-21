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
			--| Add your code here
			print ("Hello Eiffel World!%N")
		end

end
