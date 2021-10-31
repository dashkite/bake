import assert from "@dashkite/assert"
import { test, success } from "@dashkite/amen"
import print from "@dashkite/amen-console"

import * as _ from "@dashkite/joy"

import { convert } from "../src"
import fixtures from "./fixtures"

do -> 
  string = string = "I choose to see the beauty."

  console.log convert from: "utf8", to: "base64", string


  print await test "bake", [

    test "base16", [
      test "encoding", ->
        assert.equal fixtures.base16,
          convert from: "utf8", to: "base16", fixtures.utf8

        test "encoding", ->
        assert.equal fixtures.base16,
          convert from: "utf8", to: "hex", fixtures.utf8

      test "decoding", ->
        assert.equal fixtures.utf8,
          convert from: "base16", to: "utf8", fixtures.base16

        assert.equal fixtures.utf8,
          convert from: "hex", to: "utf8", fixtures.base16
    ]

    test "base36", [
      test "encoding", ->
        assert.equal fixtures.base36,
          convert from: "utf8", to: "base36", fixtures.utf8

      test "decoding", ->
        assert.equal fixtures.utf8,
          convert from: "base36", to: "utf8", fixtures.base36
    ]

    test "base64", [
      test "encoding", ->
        assert.equal fixtures.base64,
          convert from: "utf8", to: "base64", fixtures.utf8

      test "decoding", ->
        assert.equal fixtures.utf8,
          convert from: "base64", to: "utf8", fixtures.base64
    ]

    test "base64url", [
      test "encoding", ->
        assert.equal fixtures.base64url,
          convert from: "utf8", to: "base64url", fixtures.utf8

      test "decoding", ->
        assert.equal fixtures.utf8,
          convert from: "base64url", to: "utf8", fixtures.base64url
    ]

    test "json", [
      test "encoding", ->
        assert.equal fixtures.json,
          convert from: "utf8", to: "json", fixtures.utf8

      test "decoding", ->
        assert.equal fixtures.utf8,
          convert from: "json", to: "utf8", fixtures.json
    ]

    test "uri", [
      test "encoding", ->
        assert.equal fixtures.uri,
          convert from: "utf8", to: "uri", fixtures.utf8

      test "decoding", ->
        assert.equal fixtures.utf8,
          convert from: "uri", to: "utf8", fixtures.uri
    ]
      
  ]

  process.exit if success then 0 else 1