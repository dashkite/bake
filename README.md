# bake

*Universal JavaScript Encoding Transformations Toolkit*

[![Hippocratic License HL3-CORE](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CORE&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/core.html)

"bake" (pronounced "bah-keh") is the romaji representation of a Japanese word meaning "change" or "transform". This name is a playful reference to mojibake, describing character encoding failures that result in unintended transformations. The package offers a toolkit for universally converting JavaScript strings and byte arrays across a variety of standard formats.

## Features

- Provides universal environment support, functioning transparently in both Node.js and browser contexts.
- Enables fluent, bidirectional transformation between an array of standard encodings, including Base64, Hex, Base36, and JSON.
- Wraps complex encoding details in a simple, uniform `convert` utility.
- Employs a curried, functional style compatible with modern, declarative JavaScript workflows.

## Installation

```bash
pnpm install @dashkite/bake
```

## Usage

This package is designed around standard interfaces and published as transpiled JavaScript, allowing developers to use it freely across environments.

```coffeescript
import { convert } from "@dashkite/bake"

# We start with a simple string
string = "I choose to see the beauty."

# Convert the string to a Base64 representation
message = convert from: "utf8", to: "base64", string

# The message string is now Base64 encoded:
# SSBjaG9vc2UgdG8gc2VlIHRoZSBiZWF1dHku
```

## Other Resources

For comprehensive information about the package, refer to the documents inside the `docs/` directory:

- [API Reference](docs/reference.md)
- [Recipes and Usage Guides](docs/recipes.md)
- [Technical Notes](docs/technical-notes.md)
- [Testing Information](docs/testing.md)