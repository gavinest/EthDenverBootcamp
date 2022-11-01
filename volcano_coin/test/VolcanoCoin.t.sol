// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/VolcanoCoin.sol";


contract TestVolcanoCoin is Test {
    VolcanoCoin public volcano_coin;

    function setUp() public {
        volcano_coin = new VolcanoCoin();
    }

    function testInitialSupply() public {
        assertEq(volcano_coin.supply(), 10000);   
    }

    function testIncreaseSupply() public {
        // act
        volcano_coin.increaseSupply();

        // assert
        assertEq(volcano_coin.supply(), 11000);
    }

    function testOnlyOwnerCanIncreaseSupply() public {
        // arrange
        vm.expectRevert(bytes("Ownable: caller is not the owner"));
        vm.prank(address(0));

        // act
        volcano_coin.increaseSupply();
    }
}