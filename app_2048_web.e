note
	description: "[
						This class implements the `Hello World' service.
		
						It inherits from WSF_DEFAULT_RESPONSE_SERVICE to get default EWF connector ready
						only `response' needs to be implemented.
						In this example, it is redefined and specialized to be WSF_PAGE_RESPONSE
		
						`initialize' can be redefine to provide custom options if needed.
	]"

class
	APP_2048_WEB

inherit

	WSF_DEFAULT_RESPONSE_SERVICE
		redefine
			initialize
		end

create
	make_and_launch

feature
	controller: CONTROLLER_2048
	is_attached : BOOLEAN

feature {NONE} -- Execution

	response (req: WSF_REQUEST): WSF_HTML_PAGE_RESPONSE
			-- Computed response message.
		do
			create Result.make
			--TODO: Download the http://code.jquery.com/jquery-latest.min.js and call locally
			Result.add_javascript_url ("http://code.jquery.com/jquery-latest.min.js")
Result.add_javascript_content("function getChoice(keyCode){var ret='';if (keyCode == 119)ret = 'w';if (keyCode == 115)ret = 's';if (keyCode == 100)ret = 'd';if (keyCode == 97)ret = 'a';return ret;}")
Result.add_javascript_content ("$(document).keypress(function (e) {var key = getChoice(e.keyCode);if(key != ''){$.ajax({type : 'POST',url:'http://localhost:9999/',data:{user:key},contentType:'json',headers: {Accept : 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8','Content-Type': 'application/x-www-form-urlencoded'}}).done(function(data){document.open();document.write(data);document.close();})}})")


			if not is_attached then
				is_attached := true
				create controller.make
				--TODO: Download the http://gabrielecirulli.github.io/2048/style/main.css and call locally
				Result.set_body (
				"<link rel='stylesheet' type='text/css' href='http://gabrielecirulli.github.io/2048/style/main.css'>" +
					controller.board.out)
			else

				if attached req.string_item ("user") as l_user then
					if l_user.is_equal ("w") then
						if controller.board.can_move_up then
							controller.up
						end
					end
					if l_user.is_equal ("s") then
						if controller.board.can_move_down then
							controller.down
						end
					end
					if l_user.is_equal ("a") then
						if controller.board.can_move_left then
							controller.left
						end
					end
					if l_user.is_equal ("d") then
						if controller.board.can_move_right then
							controller.right
						end
					end
					if controller.board.is_winning_board then
						Result.add_javascript_content ("alert('YOU WON!!!!!!!!!!!!!!')")
					end

					if not controller.board.can_move_up and not controller.board.can_move_down and not controller.board.can_move_left and not controller.board.can_move_right then
						Result.add_javascript_content ("alert('YOU LOST!!!!!!!!!!!!!!')")
					end
					--TODO: Download the http://gabrielecirulli.github.io/2048/style/main.css and call locally
					Result.set_body (
					"<link rel='stylesheet' type='text/css' href='http://gabrielecirulli.github.io/2048/style/main.css'>" +
					controller.board.out
					)
				end
			end

				--| note:
				--| 1) Source of the parameter, we could have used
				--|		 req.query_parameter ("user") to search only in the query string
				--|		 req.form_parameter ("user") to search only in the form parameters
				--| 2) response type
				--| 	it could also have used WSF_PAGE_REPONSE, and build the html in the code
				--|

		end

feature {NONE} -- Initialization

	initialize
		do
				--| Uncomment the following line, to be able to load options from the file ewf.ini
			create {WSF_SERVICE_LAUNCHER_OPTIONS_FROM_INI} service_options.make_from_file ("ewf.ini")

				--| You can also uncomment the following line if you use the Nino connector
				--| so that the server listens on port 9999
				--| quite often the port 80 is already busy
				--			set_service_option ("port", 9999)

				--| Uncomment next line to have verbose option if available
				--			set_service_option ("verbose", True)

				--| If you don't need any custom options, you are not obliged to redefine `initialize'
			Precursor
		end

end
