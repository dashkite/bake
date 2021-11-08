# We use the Uin8Array and BigInt interfaces in ECMAScript to convert 
# a byte array into a base36 number. Like base64, this format has the 
# advantage of compact expression, but base36 is always URL-safe and features 
# case-insensitivity, making it attractive for identifiers.

# TODO: Evaluate the performance more rigorously.

import { isType, isString } from "@dashkite/joy/type"
import { decodeBase16 } from "./base16"
import { bytesToBigInt, stringToBigInt } from "./helpers"

isUint8Array = isType Uint8Array

encodeBase36 = (bytes) ->
  if !(isUint8Array bytes)
    throw new Error "Input is not an Uint8Array byte array."

  (bytesToBigInt bytes).toString 36


decodeBase36 = (string) ->
  if !(isString string)
    throw new Error "Input is not a String."

  # Carefully get the string into memory without losing precision.
  try
    number = stringToBigInt string, 36
  catch
    throw new Error "Unable to parse base 36 input."

  # Base 16 provides a string with predictable character-to-byte mapping.
  decodeBase16 number.toString 16


export { encodeBase36, decodeBase36 }