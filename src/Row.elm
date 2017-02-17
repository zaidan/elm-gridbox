module Row exposing (Row, createBox, makeRow)

{-| Row of bounding boxes

# Building a Row
@docs Row, makeRow

# Building a Box
@docs createBox
-}

import Box exposing (Box, makeBox)
import Coordinate exposing(getX, getY)

{-| A row of bounding boxes.
-}
type alias Row = List Box

{-| Creates a box with given row, col, size, x- and y-offset.
-}
createBox : ( Float, Float ) -> Float -> Float -> Int -> Int -> Box
createBox ( sizeX, sizeY ) xOffset yOffset row col =
  makeBox (getX row sizeX xOffset) (getY col sizeY yOffset) row col ( sizeX, sizeY )


{-| Creates a row with given row, List of col-indexes, size, x- and y-offset.
-}
makeRow : ( Float, Float ) -> Float -> Float -> List Int -> Int -> Row
makeRow size xOffset yOffset cols row =
  List.map (createBox size xOffset yOffset row) cols
