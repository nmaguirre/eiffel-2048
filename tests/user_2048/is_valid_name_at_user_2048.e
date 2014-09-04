note
	description: "Summary description for {IS_VALID_NAME_AT_USER_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	IS_VALID_NAME_AT_USER_2048

inherit
	EQA_TEST_SET

feature

	is_valid_name_with_valid_name
			-- Using a valid name
		local
			user : USER_2048
		do
			create user.make_for_test
			assert ("void name must be invalid", user.is_valid_name ("new_user"))
		end


	is_valid_name_with_name_with_number_in_start
			-- Using a name that starts with a number
		local
			user : USER_2048
		do
			create user.make_for_test
			assert ("void name must be invalid", not user.is_valid_name ("1asdasd"))
		end

	is_valid_name_with_empty_name
			-- Using an empty name
		local
			user : USER_2048
		do
			create user.make_for_test
			assert ("void name must be invalid", not user.is_valid_name (""))
		end

	is_valid_name_with_void_name
			-- Using an empty name
		local
			user : USER_2048
			name: STRING
		do
			create user.make_for_test
			assert ("void name must be invalid", not user.is_valid_name (name))
		end

end
