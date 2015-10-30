module Brick where

import Diagrams.Geom exposing (Point)
import List


type alias Brick =
  { name : Maybe String
  , inputs : List SlotId
  , outputs : List SlotId
  , width : Float
  , height : Float
  , position : Point
  }


type alias SlotId = Int


buildEmptyBrick : Int -> Int -> Float -> Float -> Point -> Brick
buildEmptyBrick inputs outputs width height position =
  Brick Nothing (List.repeat inputs 1) (List.repeat outputs 1) width height position
