module Form.Box exposing (fromBox, fromBoxList, fromCompressedBoxList, fromPath, makePath)

{-| Box Form Conversion

# Converting Box to Form
@docs fromBox, fromBoxList, fromCompressedBoxList

# Converting Box to Path
@docs makePath

# Converting Path to Form
@docs fromPath
-}

import Box exposing (Box)
import Extract exposing (extractBoxes)
import Collage exposing (Form, LineStyle, Path, path, traced)
import Coordinate as Coordinate

{-| Convert the Path with given LineStyle to Form.
-}
fromPath : LineStyle -> Path -> Form
fromPath lineStyle path =
  traced lineStyle path

{-| Convert the Box with given LineStyle to Form.
-}
fromBox : LineStyle -> Box -> Form
fromBox lineStyle box =
  fromPath lineStyle (makePath box)

{-| Converts a given grid with given LineStyle to a list of Forms.
-}
fromBoxList : LineStyle -> List Box -> List Form
fromBoxList lineStyle boxes =
  List.map (fromBox lineStyle) boxes

{-| Converts a given grid with given LineStyle to a list of Forms.
-}
fromCompressedBoxList : LineStyle -> ( Float, Float ) -> List ( Int, List ( Int, Int ) ) -> List Form
fromCompressedBoxList lineStyle dimensions list =
  fromBoxList lineStyle <|
    extractBoxes dimensions list
 
{-| Creates a path with given size.
-}
makePath : Box -> Path
makePath box =
  path (Coordinate.fromBox box)
