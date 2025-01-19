// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {

    uint public myFavourite_no;
    mapping (string => uint256) public NameToNumber; 

    struct Person {
        uint FavouriteNo;
        string name;
    }

    Person[] public people;

    function Add(uint _FavouriteNo, string memory _name) public {
        people.push(Person(_FavouriteNo,_name));
        NameToNumber[_name] = _FavouriteNo;
    }

    function store(uint _myFavouriteNumber) public {
        myFavourite_no = _myFavouriteNumber;
    }
}