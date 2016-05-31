module Update exposing (..)

import Models exposing (Model, initialModel)
import Messages exposing (Msg(..))
import Navigation
import Nav.Models exposing (Page(..))
import Nav.Parser exposing (toPath)


{-| The update function either resets the model (no cat is selected) or retains current model
  and navigates to selected profile (by cat id).
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    ListCats ->
      ( initialModel, Cmd.none )

    SelectCat id ->
      ( model, Navigation.newUrl (toPath (Cat id)) )

    Go path ->
      ( model, Navigation.newUrl path)
