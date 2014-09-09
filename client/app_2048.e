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

	make
			-- Run application.
		do
		end


	begin
			-- Should send a "Begin" command to the server.
			-- Must wait for response from the server with
			-- the new board.
		do

		end

	handle_up
			-- Handles the event when the user pressed up
			-- Should send an "Up" command to the server and
			-- and wait for the response with the new board status
		do

		end

	handle_down
			-- Handles the event when the user pressed up
			-- Should send an "Down" command to the server and
			-- and wait for the response with the new board status
		do

		end


end
