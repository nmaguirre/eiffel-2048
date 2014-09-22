Eiffel-2048
==========

Eiffel-2048 is an Eiffel implementation of the popular game 2048. The implementation is written entirely in Eiffel, using Design by Contract. It is developed in the context of a course of distributed software engineering.

What is 2048?
-------------

[2048] [2048] is a popular web game created by [Gabriele Cirulli] [gabriele], where you must combine tiles of the same number repeatedly until you get a tile with the number 2048.

Goals
-----

Eiffel-2048 is a student project with the following goals:

1. Learn and explore the programming language Eiffel.
2. Learn and use correctly the [Design by Contract] [Design-by-contract] approach.
3. Learn and work using the following software development processes:
    - [Test Driven Development] [TDD]
    - [Behaviour Driven Development] [BDD]

Technologies Involved
---------------------
  - EiffelStudio
  - GitHub
  - AngularJS (soon)
  
Repository Content
------------------
  - Game Class
  - Test Class
  - Binaries
  - Wiki

Road Map
=======

The core of the game is already implemented. The game is playable right now through the binaries provided in the [alpha release] [alpha-release].
The functionalities currently missing or being implemented are:

1. User management with saved games.
2. Client-Server architecture.
3. Web interface.

  
Guide
=====

Installation
============

Using the provided binaries
---------------------------

 - Download the binaries provided by the [alpha release] [alpha-release].
 - Execute the downloaded binary.

Using EiffelStudio
------------------

  - File -> Open project -> Add project 
  - Select the file "eiffel-2048.ecf" (In Action select Compile) and press Open button.
  - When finish the compile process you can run the program using the run button in EiffelStudio (or using the file in the folder EIFGENs\eiffel-2048\W_code).

Playing
=======

- To play the game, press w, a, s, d (followed by a return) to move the tiles up, left, down and right respectively.
- In a movement, each pair of colliding tiles with the same number will combine. Continue doing this until you get the 2048 tile or you don't have any move available.
- You win the game when you get the 2048 tile.
- You lose the game when you can't move in any direction.
- To quit, press q (and return) to close the application.


[gabriele]: http://gabrielecirulli.com
[2048]: http://git.io/2048
[alpha-release]: https://github.com/nmaguirre/eiffel-2048/releases
[Design-by-contract]: http://en.wikipedia.org/wiki/Design_by_contract
[TDD]: http://en.wikipedia.org/wiki/Test-driven_development
[BDD]: http://en.wikipedia.org/wiki/Behavior-driven_development