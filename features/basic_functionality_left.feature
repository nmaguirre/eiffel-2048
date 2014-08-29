Feature: Game appropriately reacts to basic movements, and basic game logic. This feature corresponds to
                Appropriate reaction to the left command (movement to the left).


        Scenario: Moving left changes board state colapsing crashing cells with
                        similar values
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |2 |2 |
                When I move left
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |4 |  |  |  |
                And (x,y) must be different from (4,1)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving left changes board state without crashing cells with
                        similar values
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |2 |  |  |  |
                        |  |  |  |2 |
                When I move left
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |  |  |  |  |
                        |  |  |  |  |
                        |2 |  |  |  |
                        |2 |  |  |  |
                And (x,y) must be different from (4,1) and (3,1)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving left changes board state with crashing cells with
                        similar values leaving residual matching cells
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |2 |2 |2 |
                When I move left
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |4 |2 |  |  |
                And (x,y) must be different from (4,1) and (4,2)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving left changes board state with crashing cells with
                        similar values leaving other residual matching cells
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |2 |2 |4 |
                When I move left
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |4 |4 |  |  |
                And (x,y) must be different from (4,1) and (4,2)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving left does not change the board 
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |8 |4 |2 |  |
                When I move left
                Then I should obtain exactly
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |8 |4 |2 |  |


        Scenario: Moving left makes you win 
                Given the game board is in state
                        |  |  |     |     |
                        |  |  |     |     |
                        |  |  |     |     |
                        |  |  |1024 |1024 |
                When I move left
                Then I should obtain exactly
                        |     |  |  |  |
                        |     |  |  |  |
                        |     |  |  |  |
                        |2048 |  |  |  |
                And the user should be informed he won        
                And the game should finish


        Scenario: Moving left makes you lose 
                Given the game board is in state
                        |2  |4  |8  |32  |
                        |4  |8  |16 |64  |
                        |8  |16 |32 |128 |
                        |   |32 |64 |128 |
                When I move left
                Then I should obtain exactly
                        |2  |4  |8  |32  |
                        |4  |8  |16 |64  |
                        |8  |16 |32 |128 |
                        |32 |64 |128| x  |
                And x should be either 4 or 2
                And the user should be informed he lost (game over)        
                And the game should finish

