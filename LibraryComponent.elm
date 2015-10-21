module LibraryComponent where

import Effects exposing (Effects, Never)
import Html exposing (..)
import Http
import Json.Decode as Json
import Task


-- MODEL

type alias Model = String


init : (Model, Effects Action)
init =
  ( "Hello world"
  , fetchMessage
  )


-- UPDATE

type Action =
  NewMessage (Maybe String)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NewMessage maybeMsg ->
      ( Maybe.withDefault model maybeMsg
      , Effects.none
      )


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div
    [ ]
    [ h2 [ ] [text model] ]


-- EFFECTS

fetchMessage : Effects Action
fetchMessage =
  Http.get decodeUrl "http://demo5895613.mockable.io/library/js/1"
    |> Task.toMaybe
    |> Task.map NewMessage
    |> Effects.task


decodeUrl : Json.Decoder String
decodeUrl =
  Json.at ["msg"] Json.string
