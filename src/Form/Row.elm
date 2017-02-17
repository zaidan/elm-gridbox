module Form.Row exposing (fromRow)

{-| Row Form Conversion

# Converting Row to Form
@docs fromRow
-}

import Row exposing (Row)
import Form.Box exposing (fromBox)
import Collage exposing (Form, LineStyle)

{-| Converts a given row with given LineStyle to a list of Forms.
-}
fromRow : LineStyle -> Row -> List Form
fromRow lineStyle row =
    List.map (fromBox lineStyle) row
