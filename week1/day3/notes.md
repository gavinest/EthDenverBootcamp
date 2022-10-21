# day 3 notes

## more solidity

* modifier - 
  
 ```solidity
// SPDX-License-Identifier: GPL-3.0 
 
 pragma solidity >=0.7.0 <0.9.0;
 
 contract Score {
 
    uint256 public score;

    // address defaults to 0 address
    address public owner;

    // note: all addresses will exist in this map but default value for uint256 will be returned instead of error
    // no way to get a list of keys from a mapping :(
    mapping(address => uint256) scoreList;
    // b/c mappings are not iterable often make a list datastructure with them to iterate through
    // note: looping through the array can cause contract to exceed gas limit.
    // if exceed gas limit. EVM will stop execution and revert what has happened
    address[] keyList;

    // dynamic array. methods: array.length, array.push(10)
    uint256[] allPossibleNumber;
    // fixed length array
    uint256[9] oneDigitNumber;

    // structs
    // declare Funder var: `Funder giver;`
    // giver.addr = msg.sender
    // giver.amount = 123;
    struct Funder {
        address addr;
        uint256 amount;
    }

    
    modifier onlyOwner {
        if (msg.sender == owner) {
            // underscore sort of replaces the function the modifier is applied to
            // like in a python decorator
            _;
        }
    }

    // log info about what happened in the contract
    // events are visible outside the contract but to the contract
    // indexed key word lets you search by matching value. i.e. can search events for matching address below
    // can only have 3 indexes in an event
    event scoreSet(uint256, address indexed);

    // constructor is only called when the contract is deployed
    constructor() {

        // initialize the value of owner
        owner = msg.sender;
    }
    
    function setScore(uint256 newScore) public onlyOwner {
        score = newScore;
        // emit the scoreSet event
        // send variable. Sending state could actually emit the old state
        // b/c it takes time to store and replicate the var through the network
        emit scoreSet(newScore, msg.sender);
    }
    
    function getUserScore(address user) public view returns (uint256) {
        return scoreList[user];
    }
 }

 ```
