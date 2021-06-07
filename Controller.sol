pragma solidity ^0.8.0;

import "./IStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Controller is Ownable {
    
    IStorage public store;
    
     address private controller;
    
    event SetController(address indexed oldOwner, address indexed newOwner);
    
      constructor() {
        controller = msg.sender; 
        emit SetController(address(0), owner);
    }
    modifier initialized () {
        require( store != IStorage(address(0)), "Controller: Storage not initialized" );
        _;
    }
   
   modifier isValidVoter(uint _age)
   {
       require(_age>=18);
   }
    function setStorage(IStorage _storage) onlyOwner external {
        require(_storage != IStorage(address(0)), "Controller: Storage 0");
        store = _storage;
    }
    
    function setNewController(address _newController) onlyOwner public {
        store.setController(_newController);
    
     function registerVoter(string memory _name, uint8 _age) initialized isValidVoter public returns(bool) {
        store.registerVoter(_name, _age, msg.sender);
        return true;
    }
    function registerCandidate(string memory _name) initialized public {
        store.registerCandidate(_name);
        
    }
        function updateAge(uint8 _newAge) initialized public {
         store.updateAge(_newAge, msg.sender);
    }
}