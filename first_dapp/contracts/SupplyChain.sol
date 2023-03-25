pragma solidity >=0.5.0 <0.9.0;


contract SupplyChain {


  uint public productCode;  

  mapping (string => Item) items;

  // Define a struct 'Item' with the following fields:
  struct Item {
    //farmer 
    string  productName;
    string  productCode;        // ma san pham    
    string  farmInfo;                
    string  haverstDate;
    string  shipDateFarm;       // ngay chuyen hang  

    //Packing 
    string  packingInfo;
    string  expireDate;
    string  manufactureDate;
    string  shipDatePacking;

    //Retailer
    string retailerInfo;
    string  receivedDateRetailer;
  }


  function addInfoByFarmer(
    string memory _productName,
    string memory _productCode, 
    string memory _farmInfo,
    string memory _haverstDate,
    string memory _shipDateFarm
    ) public 
    {
    Item memory newProduce; 
    newProduce.productName =_productName;
    newProduce.productCode = _productCode; 
    newProduce.farmInfo = _farmInfo;
    newProduce.haverstDate = _haverstDate;
    newProduce.shipDateFarm = _shipDateFarm;
    items[_productCode] = newProduce; 
  }



  
  function addInfoByPacking
  (string memory _productCode,
   string memory _packingInfo,
   string memory _expireDate,  
   string memory _shipDatePacking,
   string memory _manufactureDate

   ) public
    {
    items[_productCode].packingInfo = _packingInfo;
    items[_productCode].expireDate = _expireDate;
    items[_productCode].shipDatePacking = _shipDatePacking;
    items[_productCode].manufactureDate = _manufactureDate;
  }

  

  function addInfoByRetailer
  (string memory _productCode, 
   string memory _retailerInfo,
   string memory _receivedDateRetailer
   ) public
{
    items[_productCode].retailerInfo = _retailerInfo;
    items[_productCode].receivedDateRetailer = _receivedDateRetailer;
  }
 

function fetchItem(string memory _productCode) public view returns
(string memory, 
 string memory,
 string memory, 
 string memory, 
 string memory, 
 string memory ,
 string memory,
 string memory,
 string memory,
 string memory ,
 string memory


) {
   Item memory item = items[_productCode];
    return(
      item.productName,
      item.productCode,
      item.farmInfo,
      item.haverstDate,
      item.shipDateFarm,
      item.packingInfo,
      item.expireDate,
      item.manufactureDate,
      item.shipDatePacking,
      item.retailerInfo,
      item.receivedDateRetailer
    );
}

}