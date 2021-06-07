pragma solidity ^0.8.0;

import './Controller.sol';
contract Ballot {

    struct Candidate {
        uint candidateId;
        string name;
        uint voteCount;
    }
    
    Candidate[] public candidates;
    // mapping(uint => Candidate) private candidates;
  
    struct Voter{
         uint voterId;
         uint age;
     }
     
     mapping (address=>bool) private voters;
     
     uint public candidatesCount;
     
     Controller private control;

     function addCandidate (string[] memory _names) public {
         for (uint i=0;i<_name.length;i++)
         {
             candidates.push(Candidate(
               {
                   name: _names[i],
                   voteCount: 0
                   
               }));
               candidateId++;
         }
       // candidatesCount ++;
        //candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
    function vote (uint _candidateId) public {
       // require(control.registerVoter(string,));
        require(!voters[msg.sender]); //single vote
        require(_candidateId > 0 && _candidateId <= candidatesCount); // valid candidate
      
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount ++;
    }
    
    
}
