module Box exposing (Box, BoxRow, BoxCol, makeBox)

{-| A bounding box

# Create a box
@docs Box, BoxRow, BoxCol, makeBox
-}

{-| A grid box with position (x,y) at row and col with size.
-}
type alias Box =
  { x : Float
  , y : Float
  , row : BoxRow
  , col : BoxCol
  , width : Float
  , height : Float
  }

{-| Row of a box
-}
type alias BoxRow = Int

{-| Col of a box
-}
type alias BoxCol = Int

{-| Creates a box with position (x,y) at row and col with given size.
-}
makeBox : Float -> Float -> Int -> Int -> ( Float, Float ) -> Box
makeBox x y row col ( width, height ) =
  Box x y row col width height
