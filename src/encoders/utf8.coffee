# Be careful with the encode-decode name convention.
# The general meaning of "encoding" is to place data into a desired format.
# For people who write encoders, that desired format is a binary representation.
# Bake, however, is concerned with giving developers access to transformation,
# and so encode and decode are relative to application developer-specified formats.
# So here, we export functions with a reversed naming convention. 

export { encode as decodeUTF8, decode as encodeUTF8 } from "@stablelib/utf8"