module Models exposing (..)

import Router.Models exposing (Page(..))

{-| In this example we have two different pages, one for user list and one for
  selected user's profile.
-}


type alias User =
  { id : Int
  , name : String
  , profilePicture : String
  }


type alias Model =
  { userList : List User
  , currentPage : Page
  , selectedUserId : Int
  }


emptyUser : User
emptyUser =
  { id = 0
  , name = ""
  , profilePicture = ""
  }


users : List User
users =
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
  { userList = users
  , currentPage = UserListPage
  , selectedUserId = 0
  }
