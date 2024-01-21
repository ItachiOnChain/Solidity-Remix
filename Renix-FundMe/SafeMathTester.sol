// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SafeMathTester {
    uint256 public bigNumber =255;

    function add() public {
        unchecked {bigNumber=bigNumber+1;}
    }
}
