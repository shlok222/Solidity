// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "./AggregatorV3Interface.sol";

contract FundMe {

    uint256 minimumUsd = 5e18;

    address[] public funders;

    mapping (address funders => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable{
        require(getConversionRate(msg.value) >= minimumUsd, "Does not have enough ETH");
        funders.push(msg.sender);
         addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    function getPrice() public view returns (uint256){
        //Address - 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,)= priceFeed.latestRoundData();
        return uint(answer * 1e10);
    }

    function getConversionRate(uint ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}