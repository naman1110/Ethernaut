// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract preserve {
// public library contracts 
  address public timeZone1Library;
  address public timeZone2Library;
  address public owner; 
  uint storedTime;

  function setTime(uint _time) public {
   owner=msg.sender;
  }
   
}