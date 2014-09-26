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

feature {ANY}

	local_board: BOARD_2048

	socket: NETWORK_STREAM_SOCKET

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			ghost: BOOLEAN
		do
			create_connection
			ghost := begin (socket)
			play
		end

	play

		require
			socket /= Void and local_board/= Void
		local
			ghost: BOOLEAN
		do
			ghost:= begin(socket)

			from
			until
				local_board.is_finished
			loop
					--read character
				io.read_character
					--move left
				if io.last_character.is_equal ('a') then
					ghost := handle_left_event (socket)
				end
					--move down
				if io.last_character.is_equal ('s') then
					ghost := handle_down_event (socket)
				end
					--move right
				if io.last_character.is_equal ('d') then
					ghost := handle_right_event (socket)
				end
					--move up
				if io.last_character.is_equal ('w') then
					ghost := handle_up_event (socket)
				end
				if io.last_character.is_equal ('q') then
					 handle_end_event (socket)
				end

			end
		end

feature -- User events' handling and communication with server

	begin (soc: NETWORK_STREAM_SOCKET): BOOLEAN
			-- Should send a "Begin" command to the server.
			-- Must wait for response from the server with
			-- the new board.
		local
			begin_msg: STRING
			l_medium: SED_MEDIUM_READER_WRITER
		do
			begin_msg := "Begin"
			create l_medium.make (soc)
			l_medium.set_for_writing
			independent_store (begin_msg, l_medium, True)
			l_medium.set_for_reading
			if attached {BOARD_2048} retrieved (l_medium, True) as received_board then
				local_board := received_board
				Result := True
			end
		end

	handle_up_event (soc: NETWORK_STREAM_SOCKET): BOOLEAN
			-- Handles the event when the user pressed up.
			-- Should send an "Up" command to the server.
			-- And wait for the response with the new board status
		require
			soc /= Void
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
		ensure
			non_void: Result /= Void
		end

	handle_down_event (nssocket: NETWORK_STREAM_SOCKET): BOOLEAN
			-- Handles the event when the user pressed up
			-- Should send an "Down" command to the server and
			-- and wait for the response with the new board status
		require
			nssocket /= Void
		local
			down_msg: STRING
			l_medium: SED_MEDIUM_READER_WRITER
		do
			down_msg := "Down"
			create l_medium.make (nssocket)
			l_medium.set_for_writing
			store (down_msg, l_medium)
			l_medium.set_for_reading
			if attached {BOARD_2048} retrieved (l_medium, True) as received_board then
				local_board := received_board
				Result := True
			else
				Result := False
			end
		ensure
			local_board /= Void
		end

	handle_left_event (soca: NETWORK_STREAM_SOCKET): BOOLEAN
			-- Handles the event when the user pressed up
			-- Should send an "Left" command to the server and
			-- and wait for the response with the new board status
		require
			soca /= Void
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
		ensure
			local_board /= Void
		end

	handle_right_event (soct: NETWORK_STREAM_SOCKET): BOOLEAN
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
		require
			soc /= Void
		local
			end_msg: STRING
			l_medium: SED_MEDIUM_READER_WRITER
		do
			end_msg := "End"
			create l_medium.make (soc)
			l_medium.set_for_writing
			independent_store (end_msg, l_medium, True)
		end

	create_connection
			-- Ask for host and port and create the socket
		local
			a_peer_port: INTEGER_32
			a_peer_host: STRING_8
		do
			a_peer_host := ask_for_host
			a_peer_port := ask_for_port
			print ("Conecting...")
			print (a_peer_host)
			print (":")
			print (a_peer_port)
			print ("%N")
			create socket.make_client_by_port (a_peer_port, a_peer_host)
			socket.connect
			if socket.is_connected then
				print ("Successfully connected%N")
			else
				print ("Connection failed%N")
			end
		ensure
			socket /= Void
		end

	ask_for_host: STRING_8
			-- Read from command line a string
		local
			host: STRING_8
		do
			print ("Insert the server host%N")
			io.read_line
			host := io.last_string
			Result := host
		ensure
			valid_host: Result /= Void
		end

	ask_for_port: INTEGER_32
			-- Read from command line a integer
		local
			port: INTEGER_32
		do
			print ("Insert the server port%N")
			io.read_integer_32
			port := io.last_integer_32
			Result := port
		ensure
			valid_port: Result /= Void
		end

end
