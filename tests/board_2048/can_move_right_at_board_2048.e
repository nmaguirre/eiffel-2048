note
	description: "[	Test to check if can move to right	]"
	author: "Felice Marcelo"
	date: "28/08/2014"
	revision: "1.0"
	testing: "type/manual"

class
	CAN_MOVE_RIGHT_AT_BOARD_2048

inherit
	EQA_TEST_SET

feature -- Test routines


	can_move_right_empty_board
			-- this test check when the board is empty
		local
			board: BOARD_2048
		do
			create board.make_empty
			assert ("Can move right: ok", board.can_move_right)
		end

	can_move_right_at_board_filled
			-- this method check when the board is filled
		local
			board: BOARD_2048
			i,j,k: INTEGER
		do
			create board.make_empty
			from
				i := 1
			until
				i > board.rows
			loop
				from
					k:= 2
					j:= 1
				until
					j> board.columns
				loop
					board.set_cell (i, j, k)
					j:= j+1
					k:=k*2
				end
				i:= i+1
			end
				assert ("Can not move right because the board is filled", not board.can_move_right)
		end


	can_move_right_with_values_different_and_not_filled
			-- test return false when the board is not filled and the values are different
			-- a one column is empty
		local
			board: BOARD_2048
			i,j,k: INTEGER
		do
			create board.make_empty
			from
				i := 2  -- the first column is empty
			until
				i > board.rows
			loop
				from
					j:= 2
					k:= 2
				until
					j>board.columns
				loop
					board.set_cell (i, j, k)
					j:= j+1
					k:=k*2
				end
				i:= i+1
			end
				assert ("Can not move to right because is not a equals the values ", not board.can_move_right)
		end

		can_move_right_test_when_board_is_void
				-- test with de board is void should raise an exception
			local
				board: BOARD_2048
				second_time, ok, bool: BOOLEAN

			do
				if not second_time then
					ok:=True
					create board.make
					bool:= board.can_move_right
					ok:= False
				end
					assert ("Routine failed, as expected", ok)
				rescue
					second_time := True
					if ok then
						retry
					end
			end

end


