// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {

    using PriceConverter for uint256; 
    
    uint256 public constant minUSD = 5e18;

    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner=msg.sender;
    }

    function fund() public payable {
        //myvalue = myvalue + 2;
        require(msg.value.getConversionRate() >= minUSD, "didn't sended enough Eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    function withdraw() public onlyOwner{
        //require(msg.sender==owner, "must be owner!!!");
        for(uint256 funderIndex=0; funderIndex<funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder]=0;
        }

        //reset the array
        funders= new address[](0);

        //actually withdraw the funds
        //transfer
        payable(msg.sender).transfer(address(this).balance);
        //send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess,"send failed");
        //call
        (bool callSuccess, )= payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");
    }

    modifier onlyOwner(){
        //require(msg.sender==i_owner,"Sender is not owner!");
        if (msg.sender != i_owner) {
            revert NotOwner();
        }
        _;
    }

    //what is someone send eth with fund function
    //recieve & fallback special function
    receive() external payable { fund(); }
    fallback() external payable { fund(); }
}
