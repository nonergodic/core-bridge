git clone, then run via `make test` to observe gas costs in forge test traces:

gas costs of `parseAndVerifyVM` (not including transaction overhead):
```
134,689 original
134,689 thirteen sigs (matches as expected)
 27,677 single signature
```

