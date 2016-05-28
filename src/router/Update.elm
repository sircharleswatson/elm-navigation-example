module Router.Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (..)
import Router.Models exposing (Page(..))

{-| The url is modeled as maybe to separate profile url from index url. Displayed page is
  updated based on whether the url contains user id or not.
-}
urlUpdate : Maybe Int -> Model -> ( Model, Cmd Msg )
urlUpdate userId model =
  case Debug.log "urlUpdate" userId of
    Just id ->
      ( { model
          | currentPage = ProfilePage
          , selectedUserId = id
        }
      , Cmd.none
      )

    Nothing ->
      ( { model | currentPage = UserListPage }, Cmd.none )
