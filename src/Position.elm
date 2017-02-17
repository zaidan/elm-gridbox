module Position exposing
    ( BoxPosition
    , BoxPositions
    , fromBox
    , fromBoxes
    )

{-| Position

# Types
@docs BoxPosition, BoxPositions

# Conversion
@docs fromBox, fromBoxes
-}

import Box exposing (Box, BoxRow, BoxCol)

{-| Box position
-}
type alias BoxPosition = (BoxRow, BoxCol)

{-| Box positions
-}
type alias BoxPositions = List BoxPosition

{-| Convert from Box to (row, col)
-}
fromBox : Box -> BoxPosition
fromBox box =
  (box.row, box.col)

{-| Convert all boxes in list from Box to (row, col)
-}
fromBoxes : List Box -> BoxPositions
fromBoxes boxes =
  List.map fromBox boxes
