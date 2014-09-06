note
	description: "testing the generation of random coordinate to set starting an empty cell with a value that can be equal to 2 or 4"
	author: "guille85"
	date: "04 September, 2014"
	revision: "type/manual"

class
	SET_RANDOM_FREE_CELL_AT_CONTROLLER
inherit
	EQA_TEST_SET

feature -- Test routines


test_random_mov_right
 --Scenario: Moving RIGHT changes board state moving all cells to the rightmost empty cell
 --			 and create random value (2 or 4).
 --          Given the game board is in state
 --          When i move RIGHT,

 --                        | 2 |   |   |   |
 --                        |   |   |   |   |
 --                        |   |   | 2 |   |
 --                        |   |   |   |   |					
 --                    Then I should obtain
 --                        | ? | ? | ? | 2 |
 --                        | ? | ? | ? | ? |
 --                        | ? | ? | ? | 2 |
 --                        | ? | ? | ? | ? |	
 --                    And one of the cell with question mark remaining filled with 2 or 4.

 local
 	board: BOARD_2048
	controller: CONTROLLER_2048

 	do
 	create board.make_empty
	create controller.make_with_board (board)
	controller.board.set_cell (1,1,2)
	controller.board.set_cell (3,3,2)
	controller.right
	print(board.out)
	end

test_random_mov_up
 --Scenario: Moving UP changes board state moving all cells to the upmost empty cell
 --			 and create random value (2 or 4).
 --          Given the game board is in state
 --          When i move UP,

 --                        |   |   | 4 |   |
 --                        | 2 |   |   |   |
 --                        |   |   | 2 |   |
 --                        | 2 |   |   |   |					
 --                    Then I should obtain
 --                        | 4 | ? | 4 | ? |
 --                        | ? | ? | 2 | ? |
 --                        | ? | ? | ? | ? |
 --                        | ? | ? | ? | ? |	
 --                    And one of the cell with question mark remaining filled with 2 or 4.


 local
 	board: BOARD_2048
	controller: CONTROLLER_2048

 	do
 	create board.make_empty
	create controller.make_with_board (board)
	controller.board.set_cell (2,1,2)
	controller.board.set_cell (4,1,2)
	controller.board.set_cell (1,3,4)
	controller.board.set_cell (3,3,2)
	controller.up
	print(board.out)
	end

test_random_mov_down
 --Scenario: Moving DOWN changes board state moving all cells to the downmost empty cell
 --			 and create random value (2 or 4).
 --          Given the game board is in state
 --          When i move DOWN,

 --                        |   |   | 4 |   |
 --                        | 2 |   |   |   |
 --                        |   |   | 2 |   |
 --                        | 2 |   |   |   |					
 --                    Then I should obtain
 --                        | ? | ? | ? | ? |
 --                        | ? | ? | ? | ? |
 --                        | ? | ? | 4 | ? |
 --                        | 4 | ? | 2 | ? |	
 --                    And one of the cell with question mark remaining filled with 2 or 4.


 local
 	board: BOARD_2048
	controller: CONTROLLER_2048

 	do
 	create board.make_empty
	create controller.make_with_board (board)
	controller.board.set_cell (2,1,2)
	controller.board.set_cell (4,1,2)
	controller.board.set_cell (1,3,4)
	controller.board.set_cell (3,3,2)
	controller.down
	print(board.out)
	end

test_random_mov_left
 --Scenario: Moving LEFT changes board state moving all cells to the leftmost empty cell
 --			 and create random value (2 or 4).
 --          Given the game board is in state
 --          When i move LEFT,

 --                        |   |   | 4 |   |
 --                        | 2 |   |   |   |
 --                        |   |   | 2 |   |
 --                        | 2 |   |   |   |					
 --                    Then I should obtain
 --                        | 4 | ? | ? | ? |
 --                        | 2 | ? | ? | ? |
 --                        | 2 | ? | ? | ? |
 --                        | 2 | ? | ? | ? |	
 --                    And one of the cell with question mark remaining filled with 2 or 4.


 local
 	board: BOARD_2048
	controller: CONTROLLER_2048

 	do
 	create board.make_empty
	create controller.make_with_board (board)
	controller.board.set_cell (2,1,2)
	controller.board.set_cell (4,1,2)
	controller.board.set_cell (1,3,4)
	controller.board.set_cell (3,3,2)
	controller.left
	print(board.out)
	end


end
