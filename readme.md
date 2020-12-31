# Mastermind

This is the two-player code breaking game Mastermind made with Ruby for *The Odin Project*

### How To Install

###### If you are using repl.it (https://repl.it/@Kojack8/mastermind#readme.md)

Simply press the large green run button at the top of the screen.
Then interact with the black and white console as instructed.

###### Otherwise, this game is meant to be played in the terminal using the Ruby programming language.
1. Pull this repo (https://github.com/Kojack8/mastermind)
2. Open the relevant directory
3. ~$ ruby main.rb


### How To Play

1. The CodeMaker must first select which secret code to use.
2. The CodeBreaker makes a guess, attempting to duplicate the secret code.
3. Four comparison pegs will be presented.
4. A red comparison peg indicated one guess peg contains the **correct color 
in the correct position**. A white comparison peg indicates the **correct color
in the incorrect position**. A black comparison peg indicates that color does
not exist in the secret code.
5. The position of comparison pegs is completely irrelevant. They are always
listed in the order of Red --> White --> Black.
6. The CodeBreaker continues to guess up to twelve times or until they guess 
correctly.
7. The CodeMaker is awarded single point for each guess made. If their secret code lasts all twelve rounds they are awarded a bonus point.
8. The CodeBreaker and CodeMaker swap their roles, repeating step 1-7.
9. Repeat steps 1-8 for as many rounds you've selected.

### Donald Knuth Algorithm

Any time the computer in this program guesses it executes a series of methods
that mimic Donald Knuth's algorithm for solving mastermind in five steps or less. All of the implementations in this code were written from scratch.

### Special Thanks

* Thank you Odin Project user, **rlmoser**, whose own project taught me how
to represent the block colors in the terminal.

* Donald Knuth

* Stackoverflow user **Beta**, whose partial breakdown of Knuth's algo was invaluable.
(https://stackoverflow.com/questions/62430071/donald-knuth-algorithm-mastermind)


