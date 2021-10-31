encodeJSON = (value) -> JSON.stringify value
decodeJSON = (json) -> JSON.parse json

export { encodeJSON, decodeJSON }