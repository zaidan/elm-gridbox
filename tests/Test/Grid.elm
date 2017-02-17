module Test.Grid exposing (tests)

import Test exposing (..)
import Expect

import Grid exposing (createGrid, Grid)
import Box exposing (Box)

box : Box
box = Box 0.5 0.5 0 0 1.0 1.0

grid : Grid
grid = createGrid (1.0, 1.0) 1 1 0 0 

tests : Test
tests =
  describe "createGrid"
    [ test "should create grid" <|
        \() ->
          Expect.equal grid [[box]]
    ]

