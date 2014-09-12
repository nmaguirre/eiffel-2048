note
	description: "Summary description for {SERVER_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SERVER_2048

create
	make

feature -- Creation	

	make
			-- Sets up the server and port for listening requests.
			-- Runs the main server loop.
		do

		end

	process (soc1: NETWORK_STREAM_SOCKET)
			-- Accepts communication and exchanges messages with client.
		do

		end

	handle_begin_msg
			-- Handles the reception of a "Begin" message
		do

		end

	handle_up_msg
			-- Handles the reception of a "Up" message
		do

		end

	handle_down_msg
			-- Handles the reception of a "Down" message
		do

		end

	handle_left_msg
			-- Handles the reception of a "Left" message
		do

		end

	handle_right_msg
			-- Handles the reception of a "Right" message
		do

		end

	handle_end_msg
			-- Handles the reception of a "End" message
		do

		end

feature {NONE}

	controller : CONTROLLER_2048

end
