# Why?

`xHTTP` is my package to try and replace the standard [`http`](http://package.elm-lang.org/packages/evancz/elm-http/3.0.1/) package. I found that I didn't like how generically typed some of the functions in the standard library are. For example, I think `URL` should be a type, and not represented by a string, because `"hello world"` it's a specific kind a string; a URL is a string with a protocol, a domain, and a path. Thus, `"helloworld"` is not correctly encoded, but `"http://helloworld/"` is. Yet, the standard library permits both.

`xHTTP` does not support validate that each instance of a URL is in fact a valid URL at compile time (for that, you would need a more powerful static type checker, like the one in [Wyvern](https://github.com/wyvernlang/wyvern). However, simply having a type helps to reduce human error. Computers are good at discipline, humans are not.

Right now, this package only supports URL types, but I plan to add support for the rest of the `http` package in the future. Truthfully, because `http` makes use of Native code, and is thus a blessed package by the core team, I can only really wrap the functionality that already exists since I can't implement the guts in pure Elm.

Please provide me with feedback and criticism on this package. You can reach me at `thesnowmancometh AT gmail DOT com`. I'm new to Elm and open source in general, so I'm still learning! This people like this package, I'm likely to develop future packages to address other aspects of the ecosystem I feel are deficient. <3

# Examples:

# Testing

# Contributing
