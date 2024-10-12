git clone, then run via `make test` to observe gas costs in forge test traces:

gas costs of `parseAndVerifyVM` (not including transaction overhead):
```
134,689 original
134,689 thirteen sigs (matches as expected)
 27,677 single signature
```

Original gas costs also match gas used field of Action[3] in [Etherscan Parity trace of the sample transaction](https://etherscan.io/vmtrace?txhash=0xedd3ac96bc37961cce21a33fd50449dba257737c168006b40aa65496aaf92449&type=parity).
