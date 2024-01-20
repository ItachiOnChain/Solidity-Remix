// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe {
    
    uint256 public myvalue = 1;

    function fund() public payable {
        myvalue = myvalue + 2;
        require(msg.value > 1e18, "didn't sended enough Eth");
    }

    // function withdraw(params) public {
    //     code
    // }
}
