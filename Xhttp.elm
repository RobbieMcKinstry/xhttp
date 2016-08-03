module Xhttp exposing(Url, newUrl, addParam, uriEncode, uriDecode, toString)

import Http
import Maybe
import String
import List

{-|
# Encoding and Decoding
@docs url, uriEncode, uriDecode

# Fetch Strings and JSON
@docs getString, get, post, Error

# Body Values
@docs Body, empty, string, multipart, Data, stringData

# Arbitrary Requests
@docs send, Request, Settings, defaultSettings

# Responses
@docs Response, Value, fromJson, RawError
-}
-}

{-|
@docs Url is the type representing a typical URL. I would prefer to represent this as a polymorphic record, but I couldn't figure out how to do that.
-}
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

{-|
addParam takes a Url and a key=value pair and returns an updated Url with that key/val pair added. 
-}
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

{-| 
Exactly the same as `core/http` uriEncode. This function is included so that you won't have to import `core/http` if you're using this package.
-}
uriEncode : String -> String
uriEncode str =
    Http.uriEncode str

{-| 
Exactly the same as `core/http` uriDecode. This function is included so that you won't have to import `core/http` if you're using this package.
-}
uriDecode : String -> String
uriDecode str =
    Http.uriDecode str

{-
  Encodes the URL as a string compatible with the `core/http` package in the standard library
-}
toString : Url -> String
toString url =
    case url.params of
        [] -> url.base
        _  -> url.base ++ "?" ++ String.join "&" (List.map pair url.params)

{-----------------------------------------------}
