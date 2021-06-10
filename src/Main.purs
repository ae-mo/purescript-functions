module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  log "🍝"

-- A basic function to add two integers
-- NOTE: Int -> Int -> Int is the same as
-- Int -> (Int -> Int)
add' :: Int -> Int -> Int
add' a b = a + b

-- A function that adds to 2 to an integer
add2 :: Int -> Int
add2 a = 2 + a

-- The same function as above can be implemented
-- by reusing add', because if you apply add' to a
-- single argument it will return another function
-- of type Int -> Int that will compute the desired
-- result, using the argument passed to add2' and argument
-- that remains to be passed.
-- Note that the function implementation does not need to
-- mention the argument. This is a capability of Haskell / Purescript,
-- so add2' = add' 2 is equivalent to add2' a = add' 2 a
add2' :: Int -> Int
add2' = add' 2

-- Applying a function to a number of arguments that is inferior
-- to that of the arguments it can accept is called partial
-- application. You can exploit it to get more complex
-- behavior:
applyAdd2ToArrayOfInts :: Array Int
applyAdd2ToArrayOfInts = map add2' [ 1, 2, 3, 4 ] -- returns [ 3, 4, 5, 6 ]

applyAdd2ToArrayOfInts' :: Array Int
applyAdd2ToArrayOfInts' = map (add' 2) [ 1, 2, 3, 4 ] -- returns [ 3, 4, 5, 6 ]

-- Interesting fact: mapping a function to a list of values
-- effectively replaces for loops in their most common form:
-- for (int i = 0; i < n; i++) { value = some_array[i]; ... // do something with value }
-- (where n is the length of the array) is equivalent to
-- map f some_array
-- In Haskell / Purescript, you won't find any loop construct,
-- instead you will see a lot of map, fold, traverse, etc. usage examples

-- You can use the $ operator in place of parentheses
add2repeatedly :: Int
add2repeatedly = add' 2 $ add' 5 6 -- returns 13

add2repeatedly :: Int
add2repeatedly = add' 2 (add' 5 6) -- returns 13

-- The function application operator (->) is right associative.
-- This means that a -> b -> c is equivalent to a -> (b -> c), 
-- which can be read as a function that takes an argument of
-- type a and returns a function that takes an argument of type
-- b and returns a value of type c.
-- If you want to change this behavior, you can use parentheses.
-- Say you wanted to have a function that takes a function from
-- a to b and returns a value of type c, then you would give it
-- the following type signature:
-- (a -> b) -> c
-- Type signatures can get quite contrived but once you get the
-- mechanism they start making sense. For instance:
-- Self-> (User -> Effect Unit) -> Logger -> JSX
-- is the type signature of a function that takes an argument of
-- type Self and returns a function that takes a function that
-- takes an argument of type User and returns a value of type
-- Effect Unit and returns a function that takes an argument of 
-- type Logger and returns a value of type JSX.