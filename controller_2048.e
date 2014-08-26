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
		board := new_board
	end

	make
	do
		create board.make (4, 4)
	end

feature -- Status

	board: BOARD_2048

feature {NONE}

	coord_last_random_cell: TUPLE[INTEGER, INTEGER]

feature --Movement commands

	up
		--Command that moves the cells to the uppermost possible point of the game board
		local
			i, v, j: INTEGER

		do

			from
			 	j := 1
			until
			 	j = 4
			loop
				from
					i := 4
				until
					i = 1
				loop

				if board.elements.item(i, j).get_value /= 0 then
				   if (i-1 > 0) and (board.elements.item(i-1, j).get_value /= 0) then
				      if board.elements.item(i, j).get_value = board.elements.item(i-1, j).get_value then
					     v := board.elements.item(i, j).get_value + board.elements.item(i-1, j).get_value
						 board.set_cell (i-1, j, v)
						 i := i - 1
					  end
				   else
					  if (i-2 > 0) and (board.elements.item(i-2 , j).get_value /= 0) then
						 if board.elements.item(i , j).get_value = board.elements.item(i - 2, j).get_value then
						    v := board.elements.item(i, j).get_value + board.elements.item(i-2, j).get_value
						    board.set_cell(i-2, j, v)
						    i := i - 1
						 else
						    board.set_cell(i-1, j, board.elements.item(i, j).get_value)
						    i := i - 1
						 end
					  else
						 if (i-3 > 0) and (board.elements.item(i-3 , j).get_value /= 0) then
						    if board.elements.item(i , j).get_value = board.elements.item(i - 3, j).get_value then
						       v := board.elements.item(i, j).get_value + board.elements.item(i-3, j).get_value
							   board.set_cell (i-3, j, v)
							   i := i - 1
						    else
						       board.set_cell (i-2, j, board.elements.item(i, j).get_value)
						       i := i - 1
						    end
						 end
				      end
				   end
                end
			    end --end from i
                j := j + 1
			end --end from j

			set_random

		end --end do

	down --Command that moves the cells to the lowermost possible point of the game board

		local
			i ,j ,k : INTEGER

		do

			from
				i := 1
			until
				i >= 4
			loop -- columns
				from
					j := 1
				until
					j >= 4
				loop -- rows
					if board.elements.item (i, j).get_value /= 0 then
						k := j
						j := j+1
						from
							-- search for the next element /= 0
						until
							(j>4) and (board.elements.item (i, j) /= 0)
						loop
							j := j+1
						end
						if j<=4 then -- if search is succesful
							if board.elements.item (i, k).get_value = board.elements.item (i, j).get_value  then
								board.set_cell (i, j, (board.elements.item (i, k).get_value + board.elements.item (i, j).get_value))
								board.set_cell (i, k, 0)
							end
						end
					else
						j := j+1
					end -- end if /=0
				end -- end loop j
				i := i+1
			end -- end loop i

			set_random

		end -- end do

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
				   marca_zero := True
				   -- Set coord_last_random_cell with new random cell
				   coord_last_random_cell := [tx, ty]
				end --end if
			end --end loop
		end	--end do	   		


	last_random_cell_coordinates: TUPLE[INTEGER, INTEGER]
	-- Return a tuple with the coordinates of the last randomly set cell
		do
			Result := coord_last_random_cell
		end
end
