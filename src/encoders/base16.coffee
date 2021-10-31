# We use the Uin8Array and BigInt interfaces in ECMAScript to convert 
# a byte array into a base16 (hex) number.

# TODO: Evaluate the performance more rigorously.

import * as Ty from "@dashkite/joy/type"
import { bytesToBigInt } from "./helpers"

isUint8Array = Ty.isType Uint8Array

encodeBase16 = (bytes) ->
  if !(isUint8Array bytes)
    throw new Error "Input is not an Uint8Array byte array."

  (bytesToBigInt bytes).toString 16


decodeBase16 = (string) ->
  if !(Ty.isString string)
    throw new Error "Input is not a String."

  if string.length % 2 == 1
    _string = "0" + string
  else
    _string = string
    

  length = _string.length / 2
  output = new Uint8Array length

  try
    j = 0
    for i in [ 0..length ]
      characters = _string.slice j, j + 2
      output[i] = parseInt characters, 16
      j += 2
  catch
     throw new Error "Unable to parse string input."

  output


export { encodeBase16, decodeBase16 }