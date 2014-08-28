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
			print ("|----2048--------|%N")
			print ("|                |%N")
			print ("|     MENU       |%N")
			print ("|                |%N")
			print ("|q : QUIT        |%N")
			print ("|a : LEFT        |%N")
			print ("|d : RIGHT       |%N")
			print ("|w : UP          |%N")
			print ("|s : DOWN        |%N")
			print ("|----------------|%N")
			create controller.make
			io.putstring (controller.board.out)
			from

			until
			 	controller.is_finished or  io.last_character.is_equal ('q')
			loop
				--read character
				io.read_character
				--move left
				if io.last_character.is_equal ('a') then
					controller.left
					--update board
					io.put_string (controller.board.out)
				end
				--move down
				if io.last_character.is_equal ('s') then
					controller.down
					--update board
					io.put_string (controller.board.out)
				end
				--move right
				if io.last_character.is_equal ('d') then
					controller.right
					--update board
					io.put_string (controller.board.out)
				end
				--move up
				if io.last_character.is_equal ('w') then
					controller.up
					--update board
					io.put_string (controller.board.out)
				end
				--exit

			end
			--finish game
			if	controller.is_finished 	then
				if controller.board.is_winning_board then
					print("CONGRATULATIONS!!!!!!! YOU WON!!!!!!!! :D")
				else
					print("you lost :'( ")
				end
			else
				print("q pressed, exit game")
			end

		end

feature -- Implementation

	controller: CONTROLLER_2048
			-- It takes care of the control of the 2048 game.

end
