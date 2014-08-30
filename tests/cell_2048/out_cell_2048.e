note
	description: "Summary description for {OUT_CELL_2048}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OUT_CELL_2048

inherit
	EQA_TEST_SET

feature  -- test routines

TEST_OUT_CELL_2048
	local
		board: BOARD_2048

	do

		create board.make_empty

		board.elements.item (1,1).set_value (0)
		board.elements.item (1,2).set_value (2)
		board.elements.item (1,3).set_value (4)
		board.elements.item (1,4).set_value (0)
		board.elements.item (2,1).set_value (8)

	if  board.elements.item(1,1).out.is_equal("") then
   		print("The value is correct: " + board.elements.item(1,1).out + "%N")
	else
		print("The value is incorrect")
	end

	if  board.elements.item(1,2).out.is_equal("2") then
   		print("The value is correct: " + board.elements.item(1,2).out + "%N")
	else
		print("The value is incorrect")
	end

	if  board.elements.item(1,3).out.is_equal("4") then
   		print("The value is correct: " + board.elements.item(1,3).out + "%N")
	else
		print("The value is incorrect")
	end

	if  board.elements.item(1,4).out.is_equal("2") then
   		print("The value is correct: " + board.elements.item(1,4).out + "%N")
	else
		print("The value is incorrect %N")
	end

	if  board.elements.item(2,1).out.is_equal("") then
   		print("The value is correct: " + board.elements.item(2,1).out + "%N")
	else
		print("The value is incorrect %N")
	end

  end

end
