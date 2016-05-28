module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, href, src)
import Html.Events exposing (..)
import Json.Decode as Json exposing ((:=))
import Messages exposing (..)
import Models exposing (..)
import Router.Models exposing (Page(..))


userCard : User -> Html Msg
userCard user =
  li
    [ style
        [ ( "margin-bottom", "0.5rem" )
        , ( "cursor", "pointer" )
        , ( "text-decoration", "underline" )
        ]
    , onClick (SelectUser user.id)
    ]
    [ text user.name ]


{-| The whole view is modeled after current page. Both pages have an unique structure. If we
  were to add more pages, we would need to also connect the page to a view.
-}
pageView : Model -> Html Msg
pageView model =
  case model.currentPage of
    UserListPage ->
      div []
        [ h1 [] [ text "Users" ]
        , ul []
            (List.map userCard model.userList)
        ]

    ProfilePage ->
      let
        user =
          model.userList
            |> List.filter (\user -> user.id == model.selectedUserId)
            |> List.head
            |> Maybe.withDefault emptyUser
      in
        div []
          [ h1 [] [ text "Profile" ]
          , div []
              [ h2 []
                  [ text user.name ]
              , img [ src user.profilePicture ]
                  []
              ]
          , a (clickTo "/") [ text "Back to user list" ]
          ]


{-| Some HTML is shared between different pages. If we had a navigation
  bar or a header we would add them here. Instead we just add some white-space
  around the application.
-}
view : Model -> Html Msg
view model =
  div
    [ style
        [ ( "padding", "0 1rem" )
        ]
    ]
    [ pageView model ]

clickTo : String -> List (Attribute Msg)
clickTo path =
  [ href path
  , onWithOptions
      "click"
      { stopPropagation = True, preventDefault = True }
      (Json.map (\_ -> Go path) Json.value)
  ]
