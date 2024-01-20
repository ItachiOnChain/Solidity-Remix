// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";


contract FundMe {

    using PriceConverter for uint256; 
    
    uint256 public minUSD = 5e18;

    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable {
        //myvalue = myvalue + 2;
        require(msg.value.getConversionRate() >= minUSD, "didn't sended enough Eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // function withdraw(params) public {
    //     code
    // }

}
