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
	do
	end

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
