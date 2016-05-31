module Nav.Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (..)
import Navigation
import Nav.Models exposing (Page(..))
import Nav.Parser exposing (..)

{-| The url is modeled as maybe to separate profile url from index url. Displayed page is
  updated based on whether the url contains cat id or not.
-}
urlUpdate : Result String Page -> Model -> ( Model, Cmd Msg )
urlUpdate result model =
  case Debug.log "urlUpdate" result of
    Err _ ->
      (model, Navigation.modifyUrl (toPath model.currentPage))

    Ok page ->
      case page of
        Cat id ->
          { model
            | currentPage = page
            , selectedCatId = id
          }
            ! []
        _ ->
          { model
            | currentPage = page
          }
            ! []
