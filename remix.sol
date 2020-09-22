pragma solidity ^0.4.17;
// 2 - 宣告money為contract
contract money {
  // 3 - 宣告owner變數為address型別
  address public Owner;
  string public Name;
  uint public TotalPrice;
  string public HouseAddress;
  uint public Tax;
  uint public Loan;
  string public CName;
  uint public CTotalPrice;
  string public CHouseAddress;
  uint public CTax;
  uint public CLoan;
  bool public FinancialTrue;
  bool public GovernmentTrue;
  
  function trade(string name,uint totalprice,string houseAddress) public{
    // 持有人姓名、稅金價錢，填入地址
    Name = name;
    TotalPrice = totalprice;
    HouseAddress = houseAddress;
    Tax = TotalPrice*1/20;
    Loan = TotalPrice*1/10;
    Owner = msg.sender;
  }

  function approveTax(uint index) public view returns(bool) {
      if(TotalPrice==index){
         return true;
      }
   }
//   function test() public view returns(address) {
//       return owner;
//   }
  function financial(uint loan) public returns(bool){
     if(Loan==loan){
        FinancialTrue = true;
        return true;
     }
     else
        return false;
  }
  function government(uint tax) public returns(bool){
     if(Tax==tax){
        GovernmentTrue = true;
        return true;
     }
     else
        return false;
  }
  
  function judge() public view returns(bytes32){
     // uint a = 10;
      address k; 
      if(GovernmentTrue==true&&FinancialTrue==true){
        k=msg.sender;
        return blockhash(block.number);
      }
  }
  function approveAddress(string a) public view returns(bool) {
      if (bytes(a).length != bytes(HouseAddress).length) {
        return false;
    }
    for (uint i = 0; i < bytes(a).length; i ++) {
        if(bytes(a)[i] != bytes(HouseAddress)[i]) {
            return false;
        }
    }
    return true;
    }
    
}