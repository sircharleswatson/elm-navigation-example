module Router.Parser exposing (..)

import Navigation
import String

-- URL PARSERS - check out evancz/url-parser for fancier URL parsing

fromUrl : String -> Maybe Int
fromUrl url =
  let
    _ = Debug.log "(fromUrl) path: " (url)
  in
    (String.dropLeft 1 url)
      |> String.toInt
      |> Result.toMaybe


urlParser : Navigation.Parser (Maybe Int)
urlParser =
  let
    _ = Debug.log "(urlParser)" 1
  in
    Navigation.makeParser (fromUrl << .pathname)
