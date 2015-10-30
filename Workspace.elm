module Workspace (view) where

import Brick exposing (Brick)
import DiagramsUtils
import Html exposing (..)
import Html.Attributes exposing (classList, style)


-- VIEW

actionsWidth = "16px"

view address bricks =
  div
    [ ]
    [ h2 [ ] [ text "Workspace" ]
    , workspaceActionsView address
    , workspaceView address bricks
    ]


workspaceView address bricks =
  div
    [ workspaceStyle ]
    [ fromElement <| DiagramsUtils.bricksView address bricks ]


workspaceStyle : Attribute
workspaceStyle =
  style
    [ ("margin-left", actionsWidth)
    ]


-- WORKSPACE ACTIONS

workspaceActionsView address =
  div
    [ actionsStyles ]
    [ glyphicon "play"
    , glyphicon "plus"
    ]


actionsStyles =
  style
    [ ("width", actionsWidth)
    , ("float", "left")
    ]


glyphicon name =
  span
    [ classList [ ("glyphicon", True), ("glyphicon-" ++ name, True) ] ]
    [ ]
