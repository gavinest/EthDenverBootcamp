# day 4

## inheritance

* inheritance is handle by the compiler. i.e. not a real reference to a 
contract on the blockhain

## types

### bytes

* bytes arrays: `bytes`

### strings

* string is equal to bytes but does not have length or index access

```
# comparing strings using keccak256-hash.
keccak256(abi.encodePacked(s1)) == ...

# concat strings
string.concat(s1, s2)
```

# enums

```
enum ActionChoices { GoLeft, GoRight, ...}

ActionChoices.GoLeft
```

### contancts and immutable

```
// contstants can be defined outside of contract and apply to multiple
// contracts
unint256 constant X = 32**22 + 8;

contract C {
    string constant TEXT = "abc";
    uint256 immutable decimals;
    
    constructor(unint256 _decimals) {
        // once assinged immutable is immutable
        decimals = _decimals;
    }
}
```

## error handling

*  require, assert, revert, try...catch

 ### require can have an error message

reverts txn if condition is false

`require(_amount >0, "amount must be > 0")`

### assert

* used to test an invariant in contract
* really points out a real issue in code

### try...catch

* usually used when making calls to other contracts

```
try feed.getData(token) returns (uint v) {
    ...
} catch Error(strin memory) {
    ...
} catch Panic(uint) {
    ...
}
```

* custom errors

`error NotEnoughFunds(uint requestd, uint available);`

## imports

```
import ....(github link or local)`
```

## logging

```
import "hardhat...<<logging library>>"

consol.log("eep")
```
