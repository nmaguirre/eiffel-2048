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
			-- 
		local
			user : USER_2048
		do
			create user.make_for_test
			assert ("void name must be invalid", user.is_valid_name ("new_user"))
		end


	is_valid_name_with_name_with_number
			-- has_unfinished_game testing with invalid nickname. It should break precondition
		local
			user : USER_2048
		do
			create user.make_for_test
			assert ("void name must be invalid", not user.is_valid_name ("1asdasd"))
		end

end
