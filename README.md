
# Pawn Simulator
![ruby-3.1.2](https://img.shields.io/badge/Ruby-v3.1.2-green.svg)


### User Story

The application is a simulation of a Pawn moving on a chess board, of dimensions 8
squares x 8 squares.

There are no other obstructions/pieces on the chess board.

The pawn is free to roam around the surface of the table following the rules below,
but must be prevented from falling off. Any movement that would result in the pawn
falling from the table must be prevented, however further valid movement commands
must still be allowed.



## Getting started
### Clone
To get started with the app, clone the repo
```
$ cd /path/to/repos
$ git clone 
$ cd pawn_simulator
```

### Running
This application is made using Ruby So first you need to install ruby version **3.1.2** to get started.

you can follow this tutorial for setting up ruby with rvm 
https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/install_language_runtime.html

next install all the required gems via bundler
```
$ bundle install --without production
```

If the test suite passes, you'll be ready to run the app.

```
$ ruby runner.rb
```
## NOTES
### Functionalities
It accepts the following 7 commands:
> **NOTE :** 
> - The document says the arguments should be passed in with commas in between each. I have chosen to use space instead
> - The case of inputs does not matter ie. `help` and `HELP` will be treated as the same

| Command | Arguments | Description                                                                                              |
|---------|-----------|----------------------------------------------------------------------------------------------------------|
| help    | -         | Shows this help message                                                                                  |
| place   | X Y F C   | Places the pawn at X,Y Facing ( EAST, WEST, NORTH or SOUTH) in a color (BLACK or WHITE)                  |
| move    | X         | will move the pawn one unit forward ( OR 2 if X is given as 2 ) in the direction it is currently facing. |
| left    | -         | Rotate the pawn 90 degrees in the anti clockwise direction without changing the position of the pawn.    |
| right   | -         | Rotate the pawn 90 degrees in the clockwise direction without changing the position of the pawn.         |
| report  | -         | Announce the X,Y,F and C of the pawn                                                                     |
| exit    | -         | Exits the application.                                                                                   | 


- Arguments X and Y will always be integers
- Argument F is the direction the piece is facing it can be EAST, WEST, SOUTH or NORTH
- Argument C is the color of the piece it can be either BLACK or WHITE

## Technical Design

When designing classes my primary drive was to stick to SOILD principles as
much as i can, by that in mind i have created below classes

## TESTS
This project uses `rspec` as the testing library

to run the test run using this command

```
$ bundle exec rspec
```


## EXAMPLES
```
> PLACE 0,0,NORTH,WHITE
> MOVE 1
> REPORT
Output: 0,1,NORTH,WHITE
```

```
> PLACE 0,0,NORTH,BLACK
> LEFT
> REPORT
Output: 0,0,WEST,BLACK
```

```
> PLACE 1,2,EAST,BLACK
> MOVE 2
> MOVE 1
> LEFT
> MOVE
> REPORT
Output: 3,3,NORTH,BLACK
```