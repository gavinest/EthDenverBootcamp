// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.7.3/contracts/access/Ownable.sol";

contract VolcanoCoin is Ownable {
    uint256 public supply = 10000;
    mapping(address => uint256) userBalances;
    mapping(address => Payment[]) paymentHistory;

    // structs
    struct Payment {
        uint256 amount;
        address to;
    }

    // events
    event supplyChangeEvent(uint256);
    event transferEvent(uint256, address indexed);

    constructor() {
        userBalances[msg.sender] = supply;
    }

    function increaseSupply() public onlyOwner {
        uint256 newSupply = supply + 1000;
        supply = newSupply;
        emit supplyChangeEvent(newSupply);
    }

    function userBalance(address _user) public view returns (uint256) {
        // get a user's balance
        return userBalances[_user];
    }

    function userPaymentHistory(address _user)
        public
        view
        returns (Payment[] memory)
    {
        return paymentHistory[_user];
    }

    function recordPayment(
        address _sender,
        address _to,
        uint256 _amount
    ) private {
        // record a payment in the sender's paymentHistory
        paymentHistory[_sender].push(Payment({amount: _amount, to: _to}));
    }

    function transfer(uint256 _amount, address payable _to) public payable {
        // transfer an amount to a specified address

        require(_amount > 0, "transfer amount must be greater than 0");
        require(
            msg.value >= _amount,
            "the msg.value must be greater than or equal to requested amount"
        );

        // send using recommented method https://solidity-by-example.org/sending-ether/
        (bool sent, ) = _to.call{value: _amount}("");
        require(sent, "Failed to send either");

        // record the payment after successful send
        recordPayment(msg.sender, _to, _amount);

        emit transferEvent(_amount, _to);
    }
}
