# Takes Uint8Array of bytes and outputs its equivalent BitInt instance.
bytesToBigInt = (bytes) ->
  result = 0n
  power = bytes.length - 1
  
  for byte in bytes
    result += (BigInt byte) * (256n ** (BigInt power))
    power--

  result

# Takes iterable and outputs its equivalent BitInt instance.
stringToBigInt = (string, base) ->
  result = 0n
  power = string.length - 1
  
  for char in string
    result += (BigInt parseInt char, base) * ((BigInt base) ** (BigInt power))
    power--

  result

export { bytesToBigInt, stringToBigInt }