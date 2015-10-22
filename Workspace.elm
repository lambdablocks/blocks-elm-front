module Workspace where

import Html exposing (..)
import Html.Attributes exposing (classList, style)


actionsWidth = "16px"

view address =
  div
    [ ]
    [ h2 [ ] [ text "Workspace" ]
    , workspaceActionsView address
    , workspaceView address
    ]


workspaceView address =
  div
    [ workspaceStyle ]
    [ ]


workspaceStyle : Attribute
workspaceStyle =
  style
    [ ("margin-left", actionsWidth)
    , ("background-color", "lightgray")
    , ("height", "600px")
    ]


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
