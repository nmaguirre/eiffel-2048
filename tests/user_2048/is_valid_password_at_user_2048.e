note
	description: "Test class for routine is_valid_password at USER_2048"
	author: "adriangalfioni"
	date: "September 5, 2014"
	revision: "0.01"

class
	IS_VALID_PASSWORD_AT_USER_2048

inherit
	EQA_TEST_SET

feature

	is_valid_password_with_alpha_start
			-- Using a valid password
		local
			user : USER_2048
		do
			create user.make_for_test
			assert ("password that starts with alpha must be correct", user.is_valid_password ("new_password"))
		end


	is_valid_password_with_number_start
			-- Using a valid password
		local
			user : USER_2048
		do
			create user.make_for_test
			assert ("password that starts with alpha must be correct", user.is_valid_password ("123new_password"))
		end


	is_valid_password_with_empty_password
			-- Using an empty password
		local
			user : USER_2048
		do
			create user.make_for_test
			assert ("empty password must be invalid", not user.is_valid_password (""))
		end


	is_valid_password_with_void_password
			-- Using a void string
		local
			user : USER_2048
			pass: STRING
		do
			create user.make_for_test
			assert ("void password must be invalid", not user.is_valid_password (pass))
		end

end
