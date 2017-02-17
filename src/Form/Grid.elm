module Form.Grid exposing (fromGrid)

{-| Grid Form Conversion

# Converting Grid to Form
@docs fromGrid
-}

import Grid exposing (Grid)
import Form.Row exposing (fromRow)
import Collage exposing (Form, LineStyle)

{-| Converts a given grid with given LineStyle to a list of Forms.
-}
fromGrid : LineStyle -> Grid -> List Form
fromGrid lineStyle grid =
  List.concatMap (fromRow lineStyle) grid
