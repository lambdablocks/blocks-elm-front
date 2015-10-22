import Effects exposing (Never)
import Html exposing (..)
import Html.Attributes exposing (style)
import StartApp
import Task

import LibraryComponent as Library
import WorkspaceActions


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
      [ style [ ("width", "40%"), ("float", "left") ] ]
      [ Library.view address library ]
    , div
      [ style [ ("width", "60%"), ("float", "right") ] ]
      [ h2 [ ] [ text "Workspace" ]
      , WorkspaceActions.view address
      ]
    ]


appStyles =
  style
    [ ("height", "100%")
    ]


main =
  app.html


port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks
