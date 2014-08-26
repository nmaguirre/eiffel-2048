	Scenario: Moving down changes board state colapsing crashing cells with similar values
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |2 |
			--                        |  |  |  |2 |
			--                When I move down
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |4 |
			--                And one of the empty cells remaining filled with 2 or 4.

	Scenario: Moving down does not change board state colapsing crashing cells with different values
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |2 |
			--                        |  |  |  |4 |
			--                When I move down
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |2 |
			--                        |  |  |  |4 |
	
	Scenario: Moving right changes board state moving all cells to the furthest bottom empty cell
			--                Given the game board is in state
			--                        |  |  |  |  |
			--                        |2 |  |  |  |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                When I move down
			--                Then I should obtain
			--                        |  |  |  |  |
			--                        |  |  |  |2 |
			--                        |  |  |  |  |
			--                        |  |  |  |  |
			--                And one of the empty cells remaining filled with 2 or 4.

