module Coordinate exposing
    ( fromBox
    , fromBoxes
    , getX
    , getY
    , topX
    , topY
    , transform
    , transformOffset
    )

{-| Coordinate

# Type Conversion
@docs fromBox, fromBoxes

# Transformation
@docs getX, getY, topX, topY, transform, transformOffset
-}

import Box exposing (Box)

{-| Create a List of (x,y) coordinates with given size.
-}
fromBox : Box -> List (Float, Float)
fromBox box =
  let
    offX = (box.width) / 2
    offY = (box.height) / 2
    boxX = box.x
    boxY = box.y
  in
    [ (boxX + offX, boxY + offY)
    , (boxX + offX, boxY - offY)
    , (boxX - offX, boxY - offY)
    , (boxX - offX, boxY + offY)
    , (boxX + offX, boxY + offY)
    ]

{-| Convert all boxes in list from Box to (x, y) coordinates
-}
fromBoxes : List Box -> List (List (Float, Float))
fromBoxes boxes =
  List.map fromBox boxes

{-| Get the x-position for given row, size and x-offset.
-}
getX : Int -> Float -> Float -> Float
getX col size xOffset =
  topX (toFloat(col) * size + size/2) xOffset

{-| Get the y-position for given col, size and y-offset.
-}
getY : Int -> Float -> Float -> Float
getY row size yOffset =
  topY (toFloat(row) * size + size/2) yOffset

{-| Get the given position with x-offset.
-}
topX : Float -> Float -> Float
topX pos xOffset = 
  pos + xOffset

{-| Get the given position with y-offset.
-}
topY : Float -> Float -> Float
topY pos  yOffset =
  pos + yOffset

{-| Transform given coordinates with position (x, y) and scale.
-}
transform : (Float, Float) -> Float -> (Float, Float) -> (Float, Float)
transform =
  transformOffset (0,0)

{-| Transform given coordinates with position (x, y) scale, x- and y-offset.
-}
transformOffset : (Float, Float) -> (Float, Float) -> Float -> (Float, Float) -> (Float, Float)
transformOffset (xOffset, yOffset) (ox, oy) scale (x, y) =
  (topX (scale * x) (xOffset + ox), topY (scale *y) (yOffset + oy))
