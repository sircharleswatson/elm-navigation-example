module Models exposing (..)

import Nav.Models exposing (Page(..))

{-| In this example we have two different pages, one for cat list and one for
  selected cat's profile.
-}


type alias Cat =
  { id : Int
  , name : String
  , profilePicture : String
  }


type alias Model =
  { catList : List Cat
  , currentPage : Page
  , selectedCatId : Int
  }


emptyCat : Cat
emptyCat =
  { id = 0
  , name = ""
  , profilePicture = ""
  }


cats : List Cat
cats =
  [ { id = 0
    , name = "John"
    , profilePicture = "http://placekitten.com/400/400"
    }
  , { id = 1
    , name = "Lisa"
    , profilePicture = "http://placekitten.com/g/400/400"
    }
  ]


initialModel : Model
initialModel =
  { catList = cats
  , currentPage = Home
  , selectedCatId = 0
  }
