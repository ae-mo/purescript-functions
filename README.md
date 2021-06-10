# An introduction to Purescript functions

This repository contains a small set of commented examples that illustrate how functions work in Purescript.

## Setup

The code is in the `Main` module, which is defined in the
`src/Main.purs` file.

To be able to play with it interactively, follow these steps:

1. While in the root folder of the project, run:
   ```
   $ spago repl
   ```
   This will compile the project and give you an interactive
   environment where you can evaluate Purescript expressions (also called a _repl_);

1. Import the `Main` module in the environment:
   ```
   > import Main
   ```
   Now the definitions contained in `Main` are available:
   ```
   > add2' 4
   6
   ```
If you want to modify the code, be sure to run `:reload` to get the latest version in the repl:
```
> :reload
Compiling Main
```
