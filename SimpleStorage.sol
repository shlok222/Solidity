// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {

    uint public myFavourite_no;

    struct Person {
        uint FavouriteNo;
        string name;
    }

    Person[] public people;

    function Add(uint _FavouriteNo, string memory _name) public {
        people.push(Person(_FavouriteNo,_name));
    }

    function store(uint _myFavouriteNumber) public {
        myFavourite_no = _myFavouriteNumber;
    }
}