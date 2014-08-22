Feature: The Eiffel-2048 game starts with an initial board, consisting of only two filled cells, with random values between 2-4.

        Scenario: Default game start
                When I run the application (without parameters)
                Then I should see the game board with only two, randomly picked, filled cells, 
                        with values 2 or 4.
