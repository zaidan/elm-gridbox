port module Main exposing (..)

import Test exposing (..)
import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)

import Test.Grid as Grid
import Test.Box as Box
import Test.Coordinate as Coordinate
import Test.Position as Position

tests : Test
tests = 
  describe "GridBox Tests"
    [ Grid.tests
    , Box.tests
    , Coordinate.tests
    , Position.tests
    ]

main : TestProgram
main =
  run emit tests


port emit : ( String, Value ) -> Cmd msg
