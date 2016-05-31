module Nav.Parser exposing (..)

import Navigation
import Nav.Models exposing (Page(..))
import String
import UrlParser exposing (Parser, (</>), format, int, oneOf, s, string)


-- URL PARSERS - check out evancz/url-parser for fancier URL parsing

toPath : Page -> String
toPath page =
  case page of
    Home ->
      "/"

    Cat id ->
      "/cat/" ++ toString id


urlParser : Navigation.Parser (Result String Page)
urlParser =
  Navigation.makeParser pathParser


pathParser : Navigation.Location -> Result String Page
pathParser location =
  UrlParser.parse identity pageParser (String.dropLeft 1 location.pathname)


pageParser : Parser (Page -> a) a
pageParser =
  oneOf
    [ format Home (s "")
    , format Cat (s "cat" </> int)
    ]
