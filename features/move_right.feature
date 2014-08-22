Feature: Game appropriately takes care of cells positions when moving to the right

        Scenario: Moving right changes board state colapsing crashing cells with
                        similar values
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |2 |2 |
                When I move right
                Then I should obtain
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |4 |
                And one of the empty cells remaining filled with 2 or 4.        
