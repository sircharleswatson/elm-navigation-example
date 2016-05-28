module Main exposing (..)

{- This example app shows how to use navigation functionality for showing
   different "pages" (views) based on url. Updates to url render different page views.
-}

import Messages exposing (Msg(..))
import Models exposing (..)
import Navigation
import Router.Models exposing (Page(..))
import Router.Parser exposing (..)
import Router.Update exposing (urlUpdate)
import Subscriptions exposing (..)
import Update exposing (update)
import View exposing (view)


main : Program Never
main =
  Navigation.program urlParser
    { init = init
    , view = view
    , update = update
    , urlUpdate = urlUpdate
    , subscriptions = subscriptions
    }


init : Result String Page -> ( Model, Cmd Msg )
init result =
  let
    _ = Debug.log "result: " result
  in
    urlUpdate result initialModel
