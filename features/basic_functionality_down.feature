Feature: Game appropriately reacts to basic movements, and basic game logic. This feature corresponds to
                Appropriate reaction to the down command (movement to the down).

        Background:
                Given that the server has been started
                And I have successfully connected to it through the client
                And I have successfully initiated the game

        Scenario: Moving down changes board state colapsing crashing cells with
                        similar values
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |2 |  |
                        |  |  |2 |  |
                When I move down
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |4 |  |
                And (x,y) must be different from (4,3)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving down changes board state without crashing cells with
                        similar values
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |2 |  |  |  |
                        |  |  |  |2 |
                When I move down
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |2 |  |  |2 |
                And (x,y) must be different from (4,1) and (4,4)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving down changes board state with crashing cells with
                        similar values leaving residual matching cells
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |2 |
                        |  |  |  |2 |
                        |  |  |  |2 |
                When I move down
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |2 |
                        |  |  |  |4 |
                And (x,y) must be different from (4,4) and (3,4)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving down changes board state with crashing cells with
                        similar values leaving other residual matching cells
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |2 |
                        |  |  |  |2 |
                        |  |  |  |4 |
                When I move down
                And the randomly picked coordinate for the new cell is (x,y)
                Then I should obtain
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |4 |
                        |  |  |  |4 |
                And (x,y) must be different from (4,4) and (3,4)
                And the board in position (x,y) should be filled with 2 or 4.


        Scenario: Moving down does not change the board 
                Given the game board is in state
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |8 |4 |2 |
                When I move down
                Then I should obtain exactly
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |  |  |  |
                        |  |8 |4 |2 |


        Scenario: Moving down makes you win 
                Given the game board is in state
                        |  |  |  |     |
                        |  |  |  |     |
                        |  |  |  |1024 |
                        |  |  |  |1024 |
                When I move down
                Then I should obtain exactly
                        |  |  |  |     |
                        |  |  |  |     |
                        |  |  |  |     |
                        |  |  |  |2048 |
                And the user should be informed he won        
                And the game should finish


        Scenario: Moving down makes you lose 
                Given the game board is in state
                        |2  |4  |8  |32  |
                        |4  |8  |16 |64  |
                        |8  |16 |32 |128 |
                        |16 |32 |64 |    |
                When I move down
                Then I should obtain exactly
                        |2  |4  |8  |x   |
                        |4  |8  |16 |32  |
                        |8  |16 |32 |64  |
                        |16 |32 |64 |128 |
                And x should be either 4 or 2
                And the user should be informed he lost (game over)        
                And the game should finish

