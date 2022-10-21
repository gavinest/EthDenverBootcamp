// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract VolcanoCoin {

    address owner;
    uint256 public supply = 10000;
    mapping(address => uint256) userBalances;
    mapping(address => Payment[]) paymentHistory;

    // structs
    struct Payment {
        uint256 amount;
        address recipient;
    }


    // modifiers
    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }

    // events
    event supplyChangeEvent(uint256);
    event transferEvent(uint256, address indexed);

    constructor () {
        owner = msg.sender;
        userBalances[msg.sender] = supply;
    }

    function increaseSupply () public onlyOwner {
        uint256 newSupply = supply + 1000;
        supply = newSupply;
        emit supplyChangeEvent(newSupply);
    }

    function userBalance(address _user) public view returns(uint256) {
        // get a user's balance
        return userBalances[_user];
    }

    function transfer(uint256 _amount, address payable _recipient) public payable {
        // transfer an amount to a specified address

        require(_amount > 0, "transfer amount must be greater than 0");
        require(msg.value >= _amount, "the msg.value must be greater than requested amount");

        // send using recommented method https://solidity-by-example.org/sending-ether/
        (bool sent,) = _recipient.call{value: _amount}("");
        require(sent, "Failed to send either");

        emit transferEvent(_amount, _recipient);
    }
}
