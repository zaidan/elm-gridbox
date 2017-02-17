module Form.GridPoints exposing (points, rowPoints)

{-| Grid of points

# Building a Grid of Points
@docs points, rowPoints
-}

import Grid exposing (Grid)
import Row exposing (Row)
import Collage exposing (..)
import Color exposing (..)


{-| Creates a grid of points.
-}
points : Grid -> Float -> List Form
points grid circleSize =
  case grid of
    [] ->
      []

    first :: rest ->
      rowPoints first circleSize ++ points rest circleSize


{-| Creates a row of points.
-}
rowPoints : Row -> Float -> List Form
rowPoints row circleSize =
  case row of
    [] ->
      []

    first :: rest ->
      move ( first.x, first.y ) (filled red (circle circleSize)) :: rowPoints rest circleSize
