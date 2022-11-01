# VolcanoCoin

## Dependencies

* [foundry](https://book.getfoundry.sh/getting-started/installation)
* [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master/contracts)

```
forge install OpenZeppelin/openzeppelin-contracts
```

## Tests

Run tests:

```
$ forge test

[⠘] Compiling...
[⠘] Compiling 1 files with 0.8.17
[⠊] Solc 0.8.17 finished in 2.00s
Compiler run successful

Running 3 tests for test/VolcanoCoin.t.sol:TestVolcanoCoin
[PASS] testIncreaseSupply() (gas: 14553)
[PASS] testInitialSupply() (gas: 7482)
[PASS] testOnlyOwnerCanIncreaseSupply() (gas: 11120)
Test result: ok. 3 passed; 0 failed; finished in 11.28ms
```

Run a specific test:

```
forge test -vvvv --match-test testOnlyOwnerCanIncreaseSupply
```