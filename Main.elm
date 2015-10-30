import Effects exposing (Never)
import Html exposing (..)
import Html.Attributes exposing (style)
import StartApp
import Task

import Brick
import Library
import Workspace


app =
  StartApp.start
    { init = Library.init
    , update = Library.update
    , view = view
    , inputs = []
    }


view address library =
  div
    [ appStyles ]
    [ div
      [ style [ ("width", "40%"), ("height", "100%"), ("float", "left") ] ]
      [ Library.view address library ]
    , div
      [ style [ ("width", "60%"), ("height", "100%"), ("float", "right") ] ]
      [ Workspace.view address [Brick.buildEmptyBrick 2 1 150 200 (-150, 250)] ]
    ]


appStyles : Attribute
appStyles =
  style
    [ ("height", "100%")
    ]


main =
  app.html


port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks
