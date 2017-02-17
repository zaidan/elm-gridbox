module Test.Position exposing (tests)

import Test exposing (..)
import Expect

import Box exposing (Box)
import Position exposing (fromBox)

box : Box
box = Box 0.5 0.5 0 0 1.0 1.0

tests : Test
tests =
  describe "fromBox"
    [ test "should convert from box to (row, col)" <|
        \() ->
          Expect.equal (fromBox box) (0, 0)
    ]

