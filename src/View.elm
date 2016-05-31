module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, href, src)
import Html.Events exposing (..)
import Json.Decode as Json exposing ((:=))
import Messages exposing (..)
import Models exposing (..)
import Nav.Models exposing (Page(..))
import Nav.Parser exposing (toPath)


catCard : Cat -> Html Msg
catCard cat =
  li
    [ style
        [ ( "margin-bottom", "0.5rem" )
        , ( "cursor", "pointer" )
        , ( "text-decoration", "underline" )
        ]
    , onClick (SelectCat cat.id)
    ]
    [ text cat.name ]


{-| The whole view is modeled after current page. Both pages have an unique structure. If we
  were to add more pages, we would need to also connect the page to a view.
-}
pageView : Model -> Html Msg
pageView model =
  case model.currentPage of
    Home ->
      div []
        [ h1 [] [ text "Cats" ]
        , ul []
            (List.map catCard model.catList)
        ]

    Cat id ->
      let
        cat =
          model.catList
            |> List.filter (\cat -> cat.id == model.selectedCatId)
            |> List.head
            |> Maybe.withDefault emptyCat
      in
        div []
          [ h1 [] [ text "Profile" ]
          , div []
              [ h2 []
                  [ text cat.name ]
              , img [ src cat.profilePicture ]
                  []
              ]
          , a (clickTo (toPath Home)) [ text "Back to cat list" ]
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
