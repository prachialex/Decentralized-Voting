pragma solidity ^0.8.0;

import "./IStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Controller is Ownable {
    
    IStorage public store;
    
    modifier initialized () {
        require( store != IStorage(address(0)), "Controller: Storage not initialised" );
        _;
    }
    
    function setStorage(IStorage _storage) onlyOwner external {
        require(_storage != IStorage(address(0)), "Controller: Storage 0");
        store = _storage;
    }
    
    function setNewController(address _newController) onlyOwner public {
        store.setController(_newController);
    }
    
    function registerVoter(string memory _name, uint8 _age) initialized public {
        store.regsiterVoter(_name, _age, msg.sender);
    }
        function updateAge(uint8 _newAge) initialised public {
         store.updateAge(_newAge, msg.sender);
    }
}