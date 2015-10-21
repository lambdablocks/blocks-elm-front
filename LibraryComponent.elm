module LibraryComponent where

import Effects exposing (Effects, Never)
import Html exposing (..)
import Task


-- MODEL

type alias Model = String


init : (Model, Effects Action)
init =
  ( "Hello world"
  , Effects.none
  )


-- UPDATE

type Action =
  NoOp


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NoOp ->
      (model, Effects.none)


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div
    [ ]
    [ h2 [ ] [text model] ]
