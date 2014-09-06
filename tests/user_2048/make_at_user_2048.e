note
	description: "Test class for routines make_existant_user at USER_2048"
	author: "adriangalfioni"
	date: "September 5, 2014"
	revision: "0.01"

class
	MAKE_EXISTANT_USER_AT_USER_2048

inherit
	EQA_TEST_SET

feature

	make_existant_user_with_correct_parameters
			-- Create an User using a valid name, sunname, nickname and password
		local
			user : USER_2048
			board : BOARD_2048
			test_board : BOARD_2048
			i,j : INTEGER
			equal_board: BOOLEAN
		do
			equal_board := True
			create board.make
			test_board := board

			create user.make_existant_user ("test_name", "test_surname", "test_nickname", "test_password", board)

			from
				j := 1
			until
				j > board.rows
			loop
				from
					i := 1
				until
					i > board.columns
				loop
					if
						not board.elements.item (j, i).value.is_equal (test_board.elements.item (j, i).value)
					then
						equal_board := False
					end
					i := i + 1
				end
				j := j + 1
			end

			assert ("board must be set with correct values", equal_board)
			assert ("name value must be test_name", user.name.is_equal ("test_name"))
			assert ("surname value must be test_surname", user.surname.is_equal ("test_surname"))
			assert ("nickname value must be test_nickname", user.nickname.is_equal ("test_nickname"))
			assert ("password value must be test_password", user.password.is_equal ("test_password"))
		end


	negative_test_with_empty_name
			--Create an User using empty name in contructor
		local
  			ok, try, second_time: BOOLEAN
  			user : USER_2048
  			test_board : BOARD_2048
		do
			create test_board.make
    		if not second_time then
          		ok := True
          		create user.make_existant_user ("", "surname", "nickname", "pass", test_board)
          			-- Must throw an exception
          		ok := False
    		end
    		assert ("Rutine must fail", ok)
		rescue
     		second_time := True
     		if ok then   -- If ok rutine failed
           		retry
     		end
		end


	negative_test_with_void_name
			--Create an User using void name in contructor
		local
  			ok, try, second_time: BOOLEAN
  			user : USER_2048
  			test_board : BOARD_2048
  			test_name: STRING
		do
			create test_board.make
    		if not second_time then
          		ok := True
          		create user.make_existant_user (test_name, "surname", "nickname", "pass", test_board)
          			-- Must throw an exception
          		ok := False
    		end
    		assert ("Rutine must fail", ok)
		rescue
     		second_time := True
     		if ok then   -- If ok rutine failed
           		retry
     		end
		end


	negative_test_with_name_that_start_with_number
			--Create an User using a name thats strat with a number in contructor
		local
  			ok, try, second_time: BOOLEAN
  			user : USER_2048
  			test_board : BOARD_2048
		do
			create test_board.make
    		if not second_time then
          		ok := True
          		create user.make_existant_user ("123name", "surname", "nickname", "pass", test_board)
          			-- Must throw an exception
          		ok := False
    		end
    		assert ("Rutine must fail", ok)
		rescue
     		second_time := True
     		if ok then   -- If ok rutine failed
           		retry
     		end
		end


	negative_test_with_empty_password
			--Create an User using an empty password
		local
  			ok, try, second_time: BOOLEAN
  			user : USER_2048
  			test_board : BOARD_2048
		do
			create test_board.make
    		if not second_time then
          		ok := True
          		create user.make_existant_user ("name", "surname", "nickname", "", test_board)
          			-- Must throw an exception
          		ok := False
    		end
    		assert ("Rutine must fail", ok)
		rescue
     		second_time := True
     		if ok then   -- If ok rutine failed
           		retry
     		end
		end


	negative_test_with_void_password
			--Create an User using an empty password
		local
  			ok, try, second_time: BOOLEAN
  			user : USER_2048
  			test_board : BOARD_2048
  			test_pass : STRING
		do
			create test_board.make
    		if not second_time then
          		ok := True
          		create user.make_existant_user ("name", "surname", "nickname", test_pass, test_board)
          			-- Must throw an exception
          		ok := False
    		end
    		assert ("Rutine must fail", ok)
		rescue
     		second_time := True
     		if ok then   -- If ok rutine failed
           		retry
     		end
		end


end
