module Extract exposing
  ( extractBoxes
  , extractRow
  , extractCols
  , extractCol
  )

{-| Extracting compressed boxes

# Extraction
@docs extractBoxes, extractRow, extractCols, extractCol
-}

import Box exposing (Box, makeBox)
import Coordinate exposing (getX, getY)

{-| Extract boxes
-}
extractBoxes : ( Float, Float ) -> List ( Int, List ( Int, Int ) ) -> List Box
extractBoxes dimensions rows =
  List.concat <|
    List.map (extractRow dimensions) rows

{-| Extract row
-}
extractRow : ( Float, Float ) -> ( Int, List ( Int, Int ) ) -> List Box
extractRow dimensions ( row, cols ) =
  List.concat <|
    List.map (extractCols dimensions row) cols

{-| Extract cols
-}
extractCols : ( Float, Float ) -> Int -> ( Int, Int ) -> List Box
extractCols dimensions row ( start, length ) =
  List.map (extractCol dimensions row) <|
    List.range start (start + length - 1)

{-| Extract col
-}
extractCol : ( Float, Float ) -> Int -> Int -> Box
extractCol ( w, h ) row col =
  makeBox (getX col w 0) (getY row h 0) row col ( w, h )
