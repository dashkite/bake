# Technical Notes

### Encoding Methodologies and Standards

The library builds upon well-established standards and computer science fundamentals to provide its transformations.

*   **Base64 and Base64URL**: The `base64` implementations provide standard translation into a 64-character alphabet, while `base64url` and `safe-base64` align with [RFC 4648's "base64url" mapping](https://datatracker.ietf.org/doc/html/rfc4648#section-5). This safely omits characters like `+` and `/` that have semantic meaning in URLs.
*   **Base36**: While less common than hexadecimal, base36 acts as a compact, case-insensitive mapping consisting solely of `0-9` and `a-z`. This density makes it highly attractive for generating URL-safe tokens and identifiers.
*   **Bytes**: In the context of `bake`, raw bytes are represented using [`Uint8Array`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array) structures, adhering to standard binary data conventions in modern Web APIs.
*   **UTF-8**: When transforming text, the utility utilizes standard [UTF-8](https://en.wikipedia.org/wiki/UTF-8) translation interfaces provided by the engine to map strings into byte arrays securely and reliably.

### Functional Composition

The `convert` utility relies internally on functional composition, piping decoding and encoding steps together dynamically. By utilizing `@dashkite/joy`'s functional programming patterns, it guarantees that complex multi-step conversions stay declarative and testable.
