// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { Simplestorage, Simplestorage2} from "./Simplestorage.sol";

contract Storagefactory {

    //unit256 public favouriteNumber
    //type visibility name
    
    Simplestorage[] public mySimplestoragelist;

    function createSimpleStorageContract () public {
        //How this contract know about previous or other contract
        // mySimplestorage = new Simplestorage();
        Simplestorage mySimplestorage = new Simplestorage();
        mySimplestoragelist.push(mySimplestorage);
    }

    function sfStore(uint256 _Simplestorageindex, uint256 _SimplestorageNumber) public {
        //address & ABI (application binary index)
        Simplestorage mySimplestorage = mySimplestoragelist[_Simplestorageindex];
        mySimplestorage.store(_SimplestorageNumber);
    }

    function sfGet(uint256 _Simplestorageindex) public view returns(uint256)  {
        Simplestorage mySimplestorage = mySimplestoragelist[_Simplestorageindex];
        return mySimplestorage.retrive();
    }
}
