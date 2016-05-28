module Update exposing (..)

import Models exposing (Model, initialModel)
import Messages exposing (Msg(..))
import Navigation

{-| The update function either resets the model (no user is selected) or retains current model
  and navigates to selected profile (by user id).
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    ListUsers ->
      ( initialModel, Cmd.none )

    SelectUser id ->
      ( model, Navigation.newUrl ("/" ++ toString id) )

    Go path ->
      ( model, Navigation.newUrl path)
