// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract AccessControl {
    address public owner;
    mapping(address => bool) public whitelist;

    event AddedToWhitelist(address indexed _address);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addToWhitelist(address _address) public onlyOwner {
        whitelist[_address] = true;
        emit AddedToWhitelist(_address);
    }
}
