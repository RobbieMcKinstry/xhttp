module Xhttp exposing(Url, newUrl, addParam, uriEncode, uriDecode, toString)

import Http
import Maybe
import String
import List

type alias Url = 
    { base:   String
    , params: List (String, String)
    }

newUrl : String -> Url
newUrl base =
    {
      base   = base
    , params = [ ]
    }

addParam : Url -> String -> String -> Url
addParam url key val =
    {
        url 
    |   base = url.base
    ,   params =  (key, val) :: url.params
    }

pair: (String, String) -> String
pair (a, b) =
    a ++ "=" ++ b

uriEncode : String -> String
uriEncode str =
    Http.uriEncode str

uriDecode : String -> String
uriDecode str =
    Http.uriDecode str

{-
  Encodes the URL as a string compatible with the Http package in the standard library
-}
toString : Url -> String
toString url =
    case url.params of
        [] -> url.base
        _  -> url.base ++ "?" ++ String.join "&" (List.map pair url.params)

{-----------------------------------------------}
