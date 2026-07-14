# Recipes

## Basic String Conversion

To change a basic text string into an encoded format, creators use the `convert` utility. The utility abstracts away the intermediate transformation into byte arrays, enabling developers to jump straight from one text representation to another. 

```coffeescript
import assert from "assert"
import { convert } from "@dashkite/bake"

# Assume we start with plain text
text = "\"Hello, World!\""

# Transform to URL-encoded format
encoded = convert from: "utf8", to: "uri", text

assert.equal "%22Hello,%20World!%22", encoded
```

### Steps
1. The developer imports the `convert` utility from the package.
2. The developer provides the `from` format describing the original state.
3. The developer provides the `to` format indicating the desired state.
4. The utility automatically chains the necessary encoders and decoders.

## Advanced Data Transformation

Because `convert` is curried, developers can create specialized transformation functions for repeated operations across larger sets of data. This allows for declarative processing pipelines.

```coffeescript
import assert from "assert"
import { convert } from "@dashkite/bake"

# Create a fixed encoder by omitting the data argument
toBase64 = convert from: "utf8", to: "base64"

# Apply the encoder to multiple values
# Collection mapping logic omitted
result = toBase64 "test data"

assert.equal "dGVzdCBkYXRh", result
```

### Steps
1. The creator specifies the encoding options without providing the target data.
2. The `convert` utility returns a new function configured for that exact transformation.
3. The creator passes individual data pieces through the newly created utility.

## Interacting with Raw Byte Streams

To interact with low-level systems or cryptographic APIs, developers frequently need raw binary formats instead of strings. Creators utilize the `bytes` format with `convert` to translate strings directly into `Uint8Array` instances.

```coffeescript
import assert from "assert"
import { convert } from "@dashkite/bake"

# Assume we start with plain text
text = "secret_key"

# Transform string to raw bytes array
rawBytes = convert from: "utf8", to: "bytes", text

# Apply bytes to a low-level API
# Cryptographic processing logic omitted
assert.ok rawBytes instanceof Uint8Array
assert.equal 10, rawBytes.length
```

### Steps
1. The developer imports the `convert` utility.
2. The developer provides a standard text format (e.g. `utf8`) for the origin state.
3. The developer requests `bytes` as the target format to halt transformation at the byte-array level.
4. The utility skips the final string formatting, returning the raw `Uint8Array`.

## Generating URL-Safe Identifiers

To generate compact and URL-safe identifiers, creators can directly use the underlying byte encoders instead of the higher-level `convert` utility. The `encodeBase64URL` and `encodeBase36` functions take raw bytes and format them safely for use in web addresses without unintended character escaping.

```coffeescript
import assert from "assert"
import { encodeBase64URL } from "@dashkite/bake"

# Assume we start with an array of random bytes
# Generation of random bytes omitted
bytes = new Uint8Array [ 206, 132, 203, 170, 176, 9 ]

# Transform directly to safe base64 format
identifier = encodeBase64URL bytes

assert.equal "zoTLqrAJ", identifier
```

### Steps
1. The developer imports the specific encoder utility required for the task.
2. The developer provides a `Uint8Array` of raw bytes.
3. The utility processes the bytes and returns the URL-safe formatted string.

## Validating Formats Dynamically

To safely accept dynamic input formats, developers use the utility functions to verify support before attempting a conversion. The `isSupportedEncoding` function confirms if a format string maps to a registered encoder, preventing runtime errors on unknown formats.

```coffeescript
import assert from "assert"
import { isSupportedEncoding, supportedEncodings } from "@dashkite/bake"

# Assume we receive an unknown format string from an external source
# Extraction logic omitted
requestedFormat = "hex"
unsupportedFormat = "yaml"

# Conditionally apply conversion if supported
if isSupportedEncoding requestedFormat
  assert.ok true
  
assert.equal false, isSupportedEncoding unsupportedFormat
assert.ok supportedEncodings.includes "base16"
```

### Steps
1. The developer imports the validation utilities.
2. The developer provides a string identifying the encoding format.
3. The utility returns a boolean indicating whether the target format is securely supported for transformations.
