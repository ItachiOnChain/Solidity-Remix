// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Simplestorage} from "./Simplestorage.sol";

contract addfivestorage is Simplestorage {
    // function sayHello() public pure returns (string memory) {
    //     return "hello";
    // }

    function store(uint256 _newNumber) public override {
        myFavouriteNumber= _newNumber+5;
    }
}
