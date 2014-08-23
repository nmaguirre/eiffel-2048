note
	description: "This class manages the logic of the game"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTROLLER_2048

create
	make, make_with_board

feature -- Initialisation

	make_with_board(new_board: BOARD_2048)
	do

	end

	make
	do
		create board.make (4, 4)
	end

feature -- Status

	board: BOARD_2048

feature --Movement commands

	up
		--Command that moves the cells to the uppermost possible point of the game board
		local
			i, v, j: INTEGER

		do

			from
			 	i := 4
			until
			 	i = 1
			loop
				from
					j := 1
				until
					j = 4
				loop

				if board.elements.item(i, j).get_value /= 0 then
					if 	board.elements.item(i-1, j).get_value /= 0 then
						if board.elements.item(i, j).get_value = board.elements.item(i-1, j).get_value then
							v := board.elements.item(i, j).get_value + board.elements.item(i-1, j).get_value
							board.set_cell (i-1, j, v)
						end
					else
					    if board.elements.item(i-2 , j).get_value /= 0 then
						   if board.elements.item(i , j).get_value = board.elements.item(i - 2, j).get_value then
						      v := board.elements.item(i, j).get_value + board.elements.item(i-2, j).get_value
							  board.set_cell(i-2, j, v)
						   else
						      board.set_cell(i-1, j, board.elements.item(i, j).get_value)
						   end
						else
						   if board.elements.item(i-3 , j).get_value /= 0 then
						      if board.elements.item(i , j).get_value = board.elements.item(i - 3, j).get_value then
						    	 v := board.elements.item(i, j).get_value + board.elements.item(i-3, j).get_value
								 board.set_cell (i-3, j, v)
						      else board.set_cell (i-2, j, board.elements.item(i, j).get_value)
						      end
						   end
						end
					end --end else if

				end --end first if

			    end --end from j

			end --end from i

			set_random

		end --end do

	down --Command that moves the cells to the lowermost possible point of the game board
		do
		end

	left --Command that moves the cells to the leftrmost possible point of the game board
		do
		end

	right --Command that moves the cells to the rightmost possible point of the game board
		do
		end

	set_random --Method that set 2 in board in random position

	    local
	    	marca_zero : BOOLEAN
	    	tx, ty     : INTEGER
	    	positionx  : RANDOM
	    	positiony  : RANDOM
	    do

			from
				marca_zero := False
			until
				marca_zero = True
			loop
			    tx := positionx.next_random(3)
			    tx := tx + 1
			    ty := positiony.next_random(3)
			    tx := ty + 1
				if board.elements.item(tx,ty).is_available then
				   board.elements.item(tx,ty).set_value(2)
				end --end if
			end --end loop
		end	--end do	   		

end
