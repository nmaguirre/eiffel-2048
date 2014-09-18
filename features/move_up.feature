Feature: Game appropriately takes care of cells positions when moving to up

        Scenario: Moving up changes board state colapsing crashing cells with
                        similar values
                Given the game board is in state
                        |  |  | 2|  |
                        |  |  | 2|  |
                        |  |  |  |  |
                        |  |  |  |  |
                When I move up
                Then I should obtain
                        |  |  |4 |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                And one of the empty cells remaining filled with 2 or 4.    

       Scenario: Moving up changes board state colapsing crashing cells with
                        distinct values
                Given the game board is in state
                        |  |  | 2|  |
                        |  |  | 4|  |
                        |  |  |  |  |
                        |  |  |  |  |
                When I move up
                Then I should obtain
                        |  |  |2 |  |
                        |  |  |4 |  |
                        |  |  |  |  |
                        |  |  |  |  |



       Scenario: Moving up changes board state with one cell 
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  | 4|  |  |
                When I move up
                Then I should obtain
                        |  | 4|  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                And one of the empty cells remaining filled with 2 or 4.    


       Scenario: Moving up changes board state colapsing crashing three cells with
                        similar values
                Given the game board is in state
                        |  |  | 2|  |
                        |  |  | 2|  |
                        |  |  | 2|  |
                        |  |  |  |  |
                When I move up
                Then I should obtain
                        |  |  |4 |  |
                        |  |  |2 |  |
                        |  |  |  |  |
                        |  |  |  |  |
                And one of the empty cells remaining filled with 2 or 4.    

       Scenario: Moving up changes board state 
                Given the game board is in state
                        |  | 4| 2|  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                When I move up
                Then I should obtain
                        |  | 4|2 |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
               

                
                
