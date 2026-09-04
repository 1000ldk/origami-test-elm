module Geometry exposing (Point, midpoint, scale, translate)


type alias Point =
    ( Float, Float )


midpoint : Point -> Point -> Point
midpoint ( x1, y1 ) ( x2, y2 ) =
    ( (x1 + x2) / 2, (y1 + y2) / 2 )


scale : Float -> Point -> Point
scale factor ( x, y ) =
    ( x * factor, y * factor )


translate : Point -> Point -> Point
translate ( dx, dy ) ( x, y ) =
    ( x + dx, y + dy )
