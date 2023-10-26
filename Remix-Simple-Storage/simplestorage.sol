// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; //solidity version

contract simplestorage {
    
    //types- boolean, uniit, int, address, bytes
    // bool isfovourite = true;
    // uint256 favouriteNumber = 88;
    // string favouriteNumberInText ="eighty-eight";
    // int256 fovouriteInt = -88;
    // address myAddress = 0xd516f17686f0cFc132aa142710Fb1ec687682916;
    // bytes32 favouriteByte = "cat";

    uint256 public favouriteNumber;

    // types of visibilty specifiers:
    // 1. public: visible externally and internally(creates a getter funvtion)
    // 2. private: only visible in current contract
    // 3. internal: only visile internally
    // 4. external: only visile externally(only for functions)

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    //veiw modifier: for functions disallows modification of state

    function retrive() public view returns (uint256){
        return favouriteNumber;
    }
}