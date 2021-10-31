import { decode as decodeBase64, encode as encodeBase64 } from "@stablelib/base64"

# Based on RFC 4648's "base64url" mapping:
# https://tools.ietf.org/html/rfc4648#section-5

encodeBase64URL = (bytes) ->  
  encodeBase64 bytes
  .replace(/\+/g, '-')
  .replace(/\//g, '_')
  .replace(/\=+$/, '')

decodeBase64URL = (string) ->
  padding =
    switch string.length % 4
      when 3 then "="
      when 2 then "=="
      else ""
  
  decodeBase64 string.replace(/\-/g, '+').replace(/\_/g, '/') + padding


export {
  encodeBase64, decodeBase64
  encodeBase64URL, decodeBase64URL
}

