# bake
Universal JavaScript Encoding Transformations Toolkit

"bake" (pronounced "bah-keh") is the romaji representation of a Japanese word meaning "change" or "tranform". This name is also a playful reference to [mojibake][], describing character encoding failures that result in unintended transformations.

[mojibake]: https://en.wikipedia.org/wiki/Mojibake


## Installation

```bash
npm i @dashkite/bake
```

## Usage

`bake` is designed around standard JavaScript interfaces, so you can use it freely in the browser or Node.js environments. And while DashKite writes with CoffeeScript, and that's what you'll see in examples, `bake` is published as transpiled JavaScript.

```coffeescript
import { convert } from "@dashkite/bake"

string = "I choose to see the beauty."

message = convert from: "utf8", to: "base64", string

# mesage is as follows
# SSBjaG9vc2UgdG8gc2VlIHRoZSBiZWF1dHku
```

## API

### convert

```
convert (specification, data) -> transformedData
```

`convert` accepts a `specification` and some `data` to work with. It will read the `from` and `to` properties of the `specification` and output `transformedData` for you, if it knows how.

The `specification` is an obect with the properties:

- `from`: The starting format of `data`
- `to`: The desired format of `transformedData`

## Available Formats

- base16 / hex 
- base36
- base64
- base64url
- bytes
- json
- utf8
- uri

### Format Notes

- `base64url` is based on RFC 4648's ["base64url"](https://tools.ietf.org/html/rfc4648#section-5) mapping.
- `base36` is less common than base64 and base16, but it's a useful format. Like `base64`, this format has the advantage of compact expression, but `base36` is always URL-safe and uses only lower-case, making it attractive for identifiers.
- `bytes` refers to an instance of [`Uint8Array`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array)
- `json` refers to JSON string encoding as applied to UTF8 strings. Do not use this to generally stringify data structures.
- `uri` refers to [`encodeURI`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI) as appied to UTF8 strings.