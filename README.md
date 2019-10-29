
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/majovainilla/tic-tac-toe-game">
    <img src="img/mLogo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Tic-Tac-Toe Game</h3>

  <p align="center">
    This project is part of the Microverse Ruby Section!
    <br />
    <a href="https://github.com/majovainilla/tic-tac-toe-game/issues">Report Bug</a>
    ·
    <a href="https://github.com/majovainilla/tic-tac-toe-game/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Game](#about-the-game)
* [About the Project](#about-the-project)
  * [Installation](#installation)
  * [Instructions](#instructions)
  * [Built With](#built-with)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)

<!-- ABOUT THE GAME -->
## About The Game

Tic-tac-toe (American English), noughts and crosses (British English), or Xs and Os is a paper-and-pencil game for two players, X and O, who take turns marking the spaces in a 3×3 grid. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner.

Game Rules:

1. Two player game
2. First player plays with the 'O' symbol
3. Second player plays with the 'X' symbol
4. Players take turns choosing a cell of the board to mark their symbol.
5. A player can only choose an empty cell.
6. The first player to complete a succession of 3 of their assigned symbol (O's or X's) in a row, column or diagonal wins!
7. If all of the cells are filled with a symbol and no player matched 3 symbols, the game ends in a tie.

<!-- ABOUT THE PROJECT -->
## About The Project

In here you will find a Tic-Tac-Toe game. 

The game has a basic interface that runs in the terminal.

The goals of this project are:

* Practice with OOP (Object Oriented Programming) using Ruby as the language of choice.
* Learn how to structure a Ruby project.
* Correct use of logic and interface files to keep code maintainable.
* Practice of Git Flow and Github Flow creating branches for the different features.

This is also part of the Odin project curriculum https://www.theodinproject.com/courses/ruby-programming/lessons/oop


<!-- ABOUT THE PROJECT -->
## Installation

You need to have Ruby installed in your computer to run this file: 
https://www.theodinproject.com/courses/web-development-101/lessons/installing-ruby

You can download the [repo](https://github.com/majovainilla/tic-tac-toe-game) or clone (paste on the terminal) ```git clone git@github.com:majovainilla/tic-tac-toe-game.git```

You will need to execute the main.rb file located inside the bin folder. If you are using Window, follow next step. If you are using Linux or Mac, you can follow the [instructions](https://commandercoriander.net/blog/2013/02/16/making-a-ruby-script-executable/) to make the file executable.

Open the terminal and navigate to the folder containing the tic-tac-toe game. Once you are inside, your terminal should look like this: ```User/<folder>/tic-tac-toe/```. You can type ```bin/main.rb``` to run the game.

Enjoy!! And follow the next instructions to play.



<!-- ABOUT THE PROJECT -->
## Instructions

Once you run the game, follow the prompts and instructions inside the terminal. 

1. The game is played inside the terminal.
2. You play by typing the commands in the terminal.
3. You will be prompted to type the Player 1 name and Player 2 name (press enter after each name)
4. The first player will play with the 'O' symbol, and the second player with the 'X' symbol
4. The game will prompt which player turn's it is.
5. The board has three rows and three columns. 
    a. Rows are named a,b,c from top to bottom.
    b. Columns are named 1,2,3 from left to right.
6. The player in turn should type a valid cell name and enter it to mark the board.
7. A valid cell name is comprised by a row (letter) and column (name): 'a1', 'b3'.
8. After each turn, you will see the updated board with the selections of the players. Example of a game board after the first player types in "a1" in their turn:
    ```   1  2  3  
       a [ ][O][ ] 
       b [ ][ ][ ]
       c [ ][ ][ ]
    ```
9. A player can only mark an empty cell. If they choose an already marked cell they will be prompted again.
10. The first player to match a succession of 3 of their assigned symbol (O's or X's) in a row, column or diagonal wins!
11. If all of the cells are filled with a symbol and no player matched 3 symbols, the game ends in a tie.
12. If you want to quit the game you can type "quit" instead of chosing a cell.
13. After the game ends you can start a new one by typing ```bin/main.rb``` again in the terminal.


### Built With
This project was built using these technologies.
* Ruby 
* VsCode
* Rubocop and Stickler for linting

<!-- CONTACT -->
## Contact

María José Reyes - [@majovainilla](https://github.com/majovainilla) - maria_reyes@me.com
<br />
<br />
Sarah Uryelah Silva - [@uryelah](https://twitter.com/uryelah) - [@uryelah](https://github.com/uryelah) - sarahchamorro@gmail.com

Project Link: [https://github.com/majovainilla/tic-tac-toe-game)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Microverse](https://www.microverse.org/)
* [The Odin Project](https://www.theodinproject.com/)
* [Ruby](https://www.ruby-lang.org/en/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/majovainilla/tic-tac-toe-game.svg?style=flat-square
[contributors-url]: https://github.com/majovainilla/tic-tac-toe-game/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/majovainilla/tic-tac-toe-game.svg?style=flat-square
[forks-url]: https://github.com/majovainilla/tic-tac-toe-game/network/members
[stars-shield]: https://img.shields.io/github/stars/majovainilla/tic-tac-toe-game.svg?style=flat-square
[stars-url]: https://github.com/majovainilla/tic-tac-toe-game/stargazers
[issues-shield]: https://img.shields.io/github/issues/majovainilla/tic-tac-toe-game.svg?style=flat-square
[issues-url]: https://github.com/majovainilla/tic-tac-toe-game
[product-screenshot]: img/screenshot.PNG