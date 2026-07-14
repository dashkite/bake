# API Reference

## convert

$convert: spec, value \to transformed\_value$

The `convert` function accepts a specification object and some data to transform. It reads the `from` and `to` properties of the specification and outputs the transformed data. This function is curried, allowing the specification to be provided independently of the value.

**Example**
```coffeescript
import assert from "assert"
import { convert } from "@dashkite/bake"

value = "zoTLqrAJtn4o3XbzL0/SaWo8Be8CbWI2H7g6+aetmXw="
safe  = "zoTLqrAJtn4o3XbzL0_SaWo8Be8CbWI2H7g6-aetmXw"

assert.equal safe, convert from: "base64", to: "base64url", value
```

## supportedEncodings

$supportedEncodings \to encodings\_array$

An array of strings representing the formats that this library can encode and decode.

**Example**
```coffeescript
import assert from "assert"
import { supportedEncodings } from "@dashkite/bake"

assert.ok supportedEncodings.includes "base64"
```

## isSupportedEncoding

$isSupportedEncoding: encoding \to boolean\_value$

A function that checks whether a given string is recognized as a valid format by the `convert` utility.

**Example**
```coffeescript
import assert from "assert"
import { isSupportedEncoding } from "@dashkite/bake"

assert.equal true, isSupportedEncoding "hex"
```

## encodeBase16

$encodeBase16: value \to hex\_string$

Encodes a `Uint8Array` of bytes into a Base16 (Hex) string.

## decodeBase16

$decodeBase16: hex\_string \to bytes\_array$

Decodes a Base16 (Hex) string into a `Uint8Array`.

## encodeBase36

$encodeBase36: value \to base36\_string$

Encodes a `Uint8Array` of bytes into a Base36 string. Base36 uses lowercase letters and numerals, making it excellent for identifiers.

## decodeBase36

$decodeBase36: base36\_string \to bytes\_array$

Decodes a Base36 string into a `Uint8Array`.

## encodeBase64

$encodeBase64: value \to base64\_string$

Encodes a `Uint8Array` of bytes into a standard Base64 string.

## decodeBase64

$decodeBase64: base64\_string \to bytes\_array$

Decodes a standard Base64 string into a `Uint8Array`.

## encodeBase64URL

$encodeBase64URL: value \to safe\_base64\_string$

Encodes a `Uint8Array` of bytes into a URL-safe Base64 string according to RFC 4648.

## decodeBase64URL

$decodeBase64URL: safe\_base64\_string \to bytes\_array$

Decodes a URL-safe Base64 string into a `Uint8Array`.

## encodeJSON

$encodeJSON: value \to json\_string$

Encodes a string using JSON serialization format.

## decodeJSON

$decodeJSON: json\_string \to value\_string$

Decodes a JSON serialized string back to its original value.

## encodeUTF8

$encodeUTF8: value\_string \to bytes\_array$

Encodes a standard JavaScript string into a UTF-8 `Uint8Array`.

## decodeUTF8

$decodeUTF8: bytes\_array \to value\_string$

Decodes a UTF-8 `Uint8Array` back into a standard JavaScript string.
