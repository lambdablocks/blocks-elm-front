module WorkspaceComponent where

import Html exposing (..)
import Html.Attributes exposing (style)


view address =
  div
    [ workspaceStyle ]
    [ ]


workspaceStyle : Attribute
workspaceStyle =
  style
    [ ("margin-left", "16px")
    , ("background-color", "lightgray")
    , ("height", "200px")
    ]
