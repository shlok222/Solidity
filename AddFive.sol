// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./SimpleStorage.sol";

contract AddFive is SimpleStorage {

    function store (uint _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }
}