import * as Fn from "@dashkite/joy/function"
import { 
  encodeBase16, decodeBase16
  encodeBase36, decodeBase36
  encodeBase64, decodeBase64,
  encodeBase64URL, decodeBase64URL,
  encodeUTF8, decodeUTF8,
  encodeJSON, decodeJSON
} from "./encoders"

Encoders =
  bytes: Fn.identity
  base16: encodeBase16
  base36: encodeBase36
  base64: encodeBase64
  base64url: encodeBase64URL
  "safe-base64": encodeBase64URL
  hex: encodeBase16
  json: Fn.pipe [ encodeUTF8, encodeJSON ]
  uri: Fn.pipe [ encodeUTF8, encodeURI ]
  utf8: encodeUTF8

Decoders =
  bytes: Fn.identity
  base16: decodeBase16
  base36: decodeBase36
  base64: decodeBase64
  base64url: decodeBase64URL
  "safe-base64": decodeBase64URL
  hex: decodeBase16
  json: Fn.pipe [ decodeJSON, decodeUTF8 ]
  uri: Fn.pipe [ decodeURI, decodeUTF8 ]
  utf8: decodeUTF8

convert = Fn.curry (spec, value) -> 
  encode = Encoders[ spec.to ]
  decode = Decoders[ spec.from ]

  if !encode? 
    throw new Error "Encoding specification #{spec.to} is unknown."

  if !decode?
    throw new Error "Decoding specification #{spec.from} is unknown."

  encode decode value

supportedEncodings = Object.keys Encoders
isSupportedEncoding = (x) -> x in supportedEncodings

export { 
  convert, 
  supportedEncodings, 
  isSupportedEncoding 
}