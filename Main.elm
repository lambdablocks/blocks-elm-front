import Effects exposing (Never)
import Html exposing (..)
import Html.Attributes exposing (style)
import LibraryComponent as Library
import StartApp
import Task


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
      [ style [ ("width", "40%") ] ]
      [ Library.view address library ]
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
