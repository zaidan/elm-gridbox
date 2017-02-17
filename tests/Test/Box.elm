module Test.Box exposing (tests)

import Test exposing (..)
import Expect

import Box exposing (Box, makeBox)

box : Box
box = Box 0.5 0.5 0 0 1.0 1.0

created : Box
created = makeBox 0.5 0.5 0 0 (1.0, 1.0)

tests : Test
tests =
  describe "makeBox"
    [ test "should create box" <|
        \() ->
          Expect.equal created box
    ]

