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

    uint256 myFavouriteNumber;

    // types of visibilty specifiers:
    // 1. public: visible externally and internally(creates a getter funvtion)
    // 2. private: only visible in current contract
    // 3. internal: only visile internally (bydefault)
    // 4. external: only visile externally(only for functions)

    //note 0 value is intialized to variable if no value is given
    
    //dynamic array
    //uint256[] listOfNum;
    //static array
    //uint256[5] listOfNum;

    struct person{
        string name;
        uint256 FavouriteNumber;
    }

    person[] public listOfPeople;

    // person public aditya= person("aditya",69);

    // person public aditya= person({FavouriteNumber:69, name:"aditya"});
    // person public akshay= person({FavouriteNumber:10, name:"akshay"});
    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }

    //veiw modifier: for functions disallows modification of state

    function retrive() public view returns (uint256){
        return myFavouriteNumber;
    }

    function addPerson(string memory _name,  uint256 _FavouriteNumber) public {
        // person memory newPerson = person(_name,_FavouriteNumber);
        // listOfPeople.push(newPerson);
        listOfPeople.push(person(_name,_FavouriteNumber));
    }

    // EVM can store data in 6 places: stack,code,logs
    //memory(created for short interval-temperory variable & can be changed)
    //calldata(created for short interval-temperory variable & cant be changed)
    //storage(permanent variable & can be changed)
}