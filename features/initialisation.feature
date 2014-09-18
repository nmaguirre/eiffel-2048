Feature: The Eiffel-2048 game starts with an initial board, consisting of only two filled cells, with random values between 2-4.

        Background:
                Given that the server has been started
                And I have successfully connected to it through the client

        Scenario: Default game start
                When I issue a begin command through the client
                Then I should see the game board with only two, randomly picked, filled cells, 
                        with values 2 or 4.
