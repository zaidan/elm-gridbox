module Grid exposing (Grid, createGrid, makeGrid)

{-| Grid of bounding boxes

# Building a Grid
@docs Grid, createGrid, makeGrid
-}

import Row exposing (Row, makeRow)

{-| A grid of bounding boxes.
-}
type alias Grid = List Row

{-| Creates a grid with given List of row- and col-indexes, size, x- and y-offset.
-}
makeGrid : List Int -> List Int -> ( Float, Float ) -> Float -> Float -> Grid
makeGrid rows cols size xOffset yOffset =
  List.map (makeRow size xOffset yOffset cols) rows

{-| Creates a grid with given size width, height, x- and y-offset.
-}
createGrid : ( Float, Float ) -> Int -> Int -> Float -> Float -> Grid
createGrid ( sizeX, sizeY ) widthInt heightInt xOffset yOffset =
  let
    width = toFloat widthInt
    height = toFloat heightInt
    lastrow = ceiling ((width  - 1) / sizeX)
    lastcol = ceiling ((height - 1) / sizeY)
    rows = List.range 0 lastrow
    cols = List.range 0 lastcol
  in
    makeGrid rows cols ( sizeX, sizeY ) xOffset yOffset
