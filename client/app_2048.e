note
	description: "eiffel-2048 application root class, for command line version of the application."
	date: "August 26, 2014"
	revision: "0.01"

class
	APP_2048

inherit

	ARGUMENTS

	SOCKET_RESOURCES

	SED_STORABLE_FACILITIES

create
	make

feature	{ANY}

	local_board: BOARD_2048

feature {NONE} -- Initialization

	make
			-- Run application.
		do

		end

	play
			-- Main game loop
		do

		end


feature	-- User events' handling and communication with server

	begin (soc: NETWORK_STREAM_SOCKET)
			-- Should send a "Begin" command to the server.
			-- Must wait for response from the server with
			-- the new board.
		local
			begin_msg: STRING
			l_medium: SED_MEDIUM_READER_WRITER
		do
			begin_msg:="Begin"
			create l_medium.make (soc)
			l_medium.set_for_writing
			independent_store (begin_msg, l_medium, True)
			l_medium.set_for_reading
			if attached {BOARD_2048} retrieved (l_medium, True) as received_board then
				local_board := received_board
			end
		end

	handle_up_event (soc: NETWORK_STREAM_SOCKET) : BOOLEAN
			-- Handles the event when the user pressed up.
			-- Should send an "Up" command to the server.
			-- And wait for the response with the new board status
		local
			up_msg: STRING
			l_medium: SED_MEDIUM_READER_WRITER
		do
			up_msg := "Up"
			create l_medium.make (soc)
			l_medium.set_for_writing
			independent_store (up_msg, l_medium, True)
			l_medium.set_for_reading
			if attached {BOARD_2048} retrieved (l_medium, True) as received_board then
			   local_board := received_board
			   Result := True
			else
			   Result := False
			end

		end

	handle_down_event
			-- Handles the event when the user pressed up
			-- Should send an "Down" command to the server and
			-- and wait for the response with the new board status
		do

		end

	handle_left_event (soca: NETWORK_STREAM_SOCKET) : BOOLEAN
			-- Handles the event when the user pressed up
			-- Should send an "Left" command to the server and
			-- and wait for the response with the new board status
		local
			msg: STRING
			l_medium: SED_MEDIUM_READER_WRITER
		do
			msg := "Left"
			create l_medium.make (soca)
			l_medium.set_for_writing
			independent_store (msg, l_medium, True)
			l_medium.set_for_reading
			if attached {BOARD_2048} retrieved (l_medium, True) as received_board then
			   local_board := received_board
			   Result := True
			else
			   Result := False
			end
		end

	handle_right_event (soct: NETWORK_STREAM_SOCKET) : BOOLEAN
			-- Handles the event when the user pressed up
			-- Should send an "Right" command to the server and
			-- and wait for the response with the new board status
		local
			msg: STRING
			l_medium: SED_MEDIUM_READER_WRITER
		do
			msg := "Right"
			create l_medium.make (soct)
			l_medium.set_for_writing
			independent_store (msg, l_medium, True)
			l_medium.set_for_reading
			if attached {BOARD_2048} retrieved (l_medium, True) as received_board then
			   local_board := received_board
			   Result := True
			else
			   Result := False
			end
		end

	handle_end_event (soc: NETWORK_STREAM_SOCKET)
			-- Should send a "End" command to the server.
		local
			end_msg: STRING
			l_medium: SED_MEDIUM_READER_WRITER
		do
			end_msg:="End"
			create l_medium.make (soc)
			l_medium.set_for_writing
			independent_store (end_msg, l_medium, True)
		end


end
