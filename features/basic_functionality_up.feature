Feature: Game appropriately reacts to basic movements, and basic game logic. This feature corresponds to
                Appropriate reaction to the up command (movement to the up).


        Scenario: Moving up changes board state colapsing crashing cells with
                        similar values
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |2 |  |
                        |  |  |2 |  |
                When I move up
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |  |  |4 |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                And (x,y) must be different from (1,3)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving up changes board state without crashing cells with
                        similar values
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |2 |  |  |  |
                        |  |  |  |2 |
                When I move up
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |2 |  |  |2 |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                And (x,y) must be different from (1,1) and (1,4)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving up changes board state with crashing cells with
                        similar values leaving residual matching cells
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |2 |
                        |  |  |  |2 |
                        |  |  |  |2 |
                When I move up
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |  |  |  |4 |
                        |  |  |  |2 |
                        |  |  |  |  |
                        |  |  |  |  |
                And (x,y) must be different from (1,4) and (2,4)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving up changes board state with crashing cells with
                        similar values leaving other residual matching cells
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |4 |
                        |  |  |  |2 |
                        |  |  |  |2 |
                When I move up
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |  |  |  |4 |
                        |  |  |  |4 |
                        |  |  |  |  |
                        |  |  |  |  |
                And (x,y) must be different from (1,4) and (2,4)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving up does not change the board 
                Given the game board is in state
                        |  |8 |4 |2 |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                When I move up
                Then I should obtain exactly
                        |  |8 |4 |2 |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |


        Scenario: Moving up makes you win 
                Given the game board is in state
                        |  |  |  |     |
                        |  |  |  |     |
                        |  |  |  |1024 |
                        |  |  |  |1024 |
                When I move up
                Then I should obtain exactly
                        |  |  |  |2048 |
                        |  |  |  |     |
                        |  |  |  |     |
                        |  |  |  |     |
                And the user should be informed he won        
                And the game should finish


        Scenario: Moving up makes you lose 
                Given the game board is in state
                        |2  |4  |8  |    |
                        |4  |8  |16 |32  |
                        |8  |16 |32 |64  |
                        |16 |32 |64 |128 |
                When I move up
                Then I should obtain exactly
                        |2  |4  |8  |32  |
                        |4  |8  |16 |64  |
                        |8  |16 |32 |128 |
                        |16 |32 |64 | x  |
                And x should be either 4 or 2
                And the user should be informed he lost (game over)        
                And the game should finish

