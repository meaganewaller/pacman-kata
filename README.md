# Pacman Kata

First iteration, just move pacman around on the board.
  - Doesn't allow invalid moves outside of bounds.
  - Doesn't allow invalid input

My approach for this was to try to make the core pacman component functional,
i.e., to not mutate the board, but instead to pass in coordinates and a marker and create a new board
for each `tick` of pacman.

I also tried to stick to using TDD to do this, at least the pacman class was designed through TDD.

## To play

- Clone this repository, once inside the repository run the `play_game` executable located in the `bin` directory.

```
$ ./bin/play_game
```
