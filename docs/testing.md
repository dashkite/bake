# Testing

The testing suite for `bake` uses an assertion-based approach driven by the `@dashkite/amen` testing framework. The tests validate the precise, bidirectional translation capabilities of each underlying encoder and the primary `convert` function.

To verify correct operation, the suite runs the transformations symmetrically. It ensures that content encoded from a native representation matches a known, hardcoded expected format string, validating that the underlying logic produces stable, standards-compliant output.

To invoke the test suite, run the following command using the `genie` task manager:

```bash
npx genie test
```
