pragma solidity ^0.8.0;

interface IStorage {
    
    function registerVoter(string memory _name, uint8 _age, address _voter) external;
    function registerCandidate(string memory _name) external;
    function updateAge(uint8 _age, address _voter) external;
    function setController(address _controller) external;
    
}