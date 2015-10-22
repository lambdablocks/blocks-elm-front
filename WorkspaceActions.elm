module WorkspaceActions where

import Html exposing (..)
import Html.Attributes exposing (classList, style)


view address =
  div
    [ actionsStyles ]
    [ glyphicon "play"
    , glyphicon "plus"
    ]


actionsStyles =
  style
    [ ("width", "16px")
    , ("float", "left")
    ]


glyphicon name =
  span
    [ classList [ ("glyphicon", True), ("glyphicon-" ++ name, True) ] ]
    [ ]
