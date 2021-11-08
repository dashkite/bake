import assert from "@dashkite/assert"
import { test, success } from "@dashkite/amen"
import print from "@dashkite/amen-console"

import { convert } from "../src"

do -> 

  print await test "bake", [

    test "base16", ->
      value = "cc002db4fd47f2da3eb570f08c485dbb54fea3a1acfe6617b0d60942ab9660a7"
      assert.equal value,
        convert from: "base16", to: "base16", value
      
      assert.equal value,
        convert from: "hex", to: "hex", value

    test "base36", ->
      value = "1ixo1ao49a2mepiqb5e"
      assert.equal value,
          convert from: "base36", to: "base36", value

    test "base64", ->
      value = "zoTLqrAJtn4o3XbzL0/SaWo8Be8CbWI2H7g6+aetmXw="
      assert.equal value,
        convert from: "base64", to: "base64", value

    test "base64url", ->
      value = "zoTLqrAJtn4o3XbzL0/SaWo8Be8CbWI2H7g6+aetmXw="
      safe  = "zoTLqrAJtn4o3XbzL0_SaWo8Be8CbWI2H7g6-aetmXw"
      assert.equal safe,
          convert from: "base64", to: "base64url", value

      assert.equal safe,
          convert from: "base64url", to: "safe-base64", safe

    test "json", ->
      value = "\"Hello, World!\""
      assert.equal value,
          convert from: "json", to: "json", value

    test "uri", ->
      value = "%22Hello%20World!%22"
      assert.equal value,
          convert from: "uri", to: "uri", value

    test "utf8", ->
      value = "\"Hello, World!\""
      assert.equal value,
        convert from: "utf8", to: "utf8", value
      
  ]

  process.exit if success then 0 else 1