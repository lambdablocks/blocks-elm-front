module DiagramsUtils where

import Color
import Diagrams.Align as Align
import Diagrams.Core exposing (..)
import Diagrams.FillStroke exposing (justSolidFill)
import Diagrams.FullWindow exposing (fullWindowView)
import List

import Brick exposing (Brick)
import Constants exposing (..)

import Diagrams.Debug exposing (..)


bricksView address bricks =
  fullWindowView (500, 600) <| group (List.map brickView bricks)


brickView : Brick -> Diagram t a
brickView brick =
  let
    inputs = brickSlots (List.length brick.inputs)
    body = brickBody brick
    outputs = brickSlots (List.length brick.outputs)
  in
    move brick.position <| inputs `Align.above` body `Align.above` outputs


brickSlots : Int -> Diagram t a
brickSlots nSlots =
  let
    slot = rect sWidth sHeight <| justSolidFill afFill
    slots = List.intersperse (hspace afSlotOffset) (List.repeat nSlots slot)
  in
    Align.alignCenter <| Align.hcat slots


brickBody : Brick -> Diagram t a
brickBody brick =
  rect brick.width brick.height <| justSolidFill afFill
