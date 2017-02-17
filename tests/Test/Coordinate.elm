module Test.Coordinate exposing (tests)

import Test exposing (..)
import Expect

import Box exposing (Box)
import Coordinate exposing (fromBox)

box : Box
box = Box 0.5 0.5 0 0 1.0 1.0

coordinates : List (Float, Float)
coordinates = [(1.0,1.0),(1.0,0.0),(0.0,0.0),(0.0,1.0),(1.0,1.0)]

tests : Test
tests =
  describe "fromBox"
    [ test "should create list of coordinates from box" <|
        \() ->
          Expect.equal (fromBox box) coordinates
    ]

