module LibraryComponent where

import Effects exposing (Effects, Never)
import Html exposing (..)
import Http
import Json.Decode as Json exposing ((:=))
import List as List
import Task


-- MODEL

type alias Library =
  { modules : List Module
  }


type alias Module =
  { name : String
  , functions : List NamedFunction
  }

type alias NamedFunction =
  { id : Int
  , name : String
  }


init : (Library, Effects Action)
init =
  ( Library []
  , fetchLibrary
  )


-- UPDATE

type Action =
  LoadLibrary (Maybe Library)


update : Action -> Library -> (Library, Effects Action)
update action model =
  case action of
    LoadLibrary maybeLibrary ->
      ( Maybe.withDefault model maybeLibrary
      , Effects.none
      )


-- VIEW

view : Signal.Address Action -> Library -> Html
view address library =
  div
    [ ]
    ( h2 [ ] [ text "Library" ] :: ( List.map ( moduleView address ) library.modules ) )


moduleView : Signal.Address Action -> Module -> Html
moduleView address libraryModule =
  div
    [ ]
    [ h3 [ ] [ text libraryModule.name ]
    , ul [ ] ( List.map ( functionView address ) libraryModule.functions )
    ]


functionView : Signal.Address Action -> NamedFunction -> Html
functionView address namedFunction =
  li [ ] [ text namedFunction.name ]


-- EFFECTS

fetchLibrary : Effects Action
fetchLibrary =
  Http.get libraryDecoder "http://demo5895613.mockable.io/library/js/1"
    |> Task.toMaybe
    |> Task.map LoadLibrary
    |> Effects.task


apply : Json.Decoder (a -> b) -> Json.Decoder a -> Json.Decoder b
apply func value =
  Json.object2 (<|) func value


libraryDecoder : Json.Decoder Library
libraryDecoder =
  Json.object1 Library ("modules" := (Json.list moduleDecoder))


moduleDecoder : Json.Decoder Module
moduleDecoder =
  Json.object2 Module ("name" := Json.string) ("functions" := (Json.list namedFunctionDecoder))


namedFunctionDecoder : Json.Decoder NamedFunction
namedFunctionDecoder =
  Json.object2 NamedFunction ("id" := Json.int) ("name" := Json.string)
