// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Voting {

    address public owner;
    address public winnerAddress;
    string public eventName;
    uint public totalVote;
    bool votingStarted;

    //Candidate with his/her basic details
    struct Candidate{
        string name;
        uint age;
        bool registered;
        address candidateAddress;
        uint votes;
    }

    struct Voter{
        bool registered; // if true, that person is already registered
        bool voted;  // if true, that person already voted
        uint vote;
    }


    event success(string msg);
    mapping(address=>uint) public candidates;
    Candidate[] public candidateList;
    mapping(address=>Voter) public voterList;

    constructor(string memory _eventName){
        owner = msg.sender;
        eventName = _eventName;
        totalVote = 0;
        votingStarted=false;
    }

    // function for registering the candidates who would want to contest to vote
    function registerCandidates(string memory _name, uint _age, address _candidateAddress) public {
        require(msg.sender == owner, "Only owner can register Candidate!!");
        require(_candidateAddress != owner, "Owner can not participate!!");
        require(candidates[_candidateAddress] == 0, "Candidate already registered");
        Candidate memory candidate = Candidate({
            name: _name,
            age: _age,
            registered: true,
            votes: 0,
            candidateAddress: _candidateAddress
        });
        if(candidateList.length == 0){ //not pushing any candidate on location zero;
            candidateList.push();
        }
        candidates[_candidateAddress] = candidateList.length;
        candidateList.push(candidate);
        emit success("Candidate registered!!");
    }

    function startNewElection(string memory _electionName) public{
        require (msg.sender==owner,"Only Chairperson can Start New Election");
        eventName=_electionName;
        //delete proposals;
    }

    function delegateYourVote(address delegateTo, address delegateFrom) public {
        // assigns reference
        require(msg.sender == owner, "Only owner can allow!!");
        require(!voterList[delegateFrom].voted, "You already voted.");
        require(delegateTo != owner, "Owner can not vote!!");
        require(delegateTo != delegateFrom, "Self-delegation is disallowed.");
        voterList[delegateTo].vote++;
        voterList[delegateFrom].voted = true;
        emit success("Delegated !!");
    }

    // function to whitelist the voter
    function whiteListAddress(address _voterAddress) public {
        require(_voterAddress != owner, "Owner can not vote!!");
        require(msg.sender == owner, "Only owner can whitelist the addresses!!");
        require(voterList[_voterAddress].registered == false, "Voter already registered!!");
        Voter memory voter = Voter({
            registered: true,
            voted: false,
            vote: 1
        });

        voterList[_voterAddress] = voter;
        emit success("Voter registered!!");
    }

    function startVoting() public {
        require(msg.sender == owner, "Only owner can start voting!!");
        votingStarted = true;
        emit success("Voting Started!!");
    }

    // function to cast the vote
    function putVote(address _candidateAddress) public {
        require(votingStarted == true, "Voting not started yet or ended!!");
        require(msg.sender != owner, "Owner can not vote!!");
        require(voterList[msg.sender].registered == true, "Voter not registered!!");
        require(voterList[msg.sender].voted == false, "Already voted!!");
        require(candidateList[candidates[_candidateAddress]].registered == true, "Candidate not registered");

        candidateList[candidates[_candidateAddress]].votes += voterList[msg.sender].vote;
        //candidateList[candidates[_candidateAddress]].votes++;
        voterList[msg.sender].voted =true;
        //candidateList[candidates].votes += candidateList[candidates[_candidateAddress]].weight;
        uint candidateVotes = candidateList[candidates[_candidateAddress]].votes;

        if(totalVote < candidateVotes){
            totalVote = candidateVotes;
            winnerAddress = _candidateAddress;
        }
        emit success("Voted !!");
        
    }

    // function to stop the voting process
    function stopVoting() public {
        require(msg.sender == owner, "Only owner can start voting!!");
        votingStarted = false;
        emit success("Voting stoped!!");
    }

    // function to view all the candidates
    function getAllCandidate() public view returns(Candidate[] memory list){
        return candidateList;
    }

    //shows the voting status - started or not
    function votingStatus() public view returns(bool){
        return votingStarted;
    }

    // declares the winner based on the number of votes
    function getWinner() public view returns(Candidate memory candidate){
        require(msg.sender == owner, "Only owner can declare winner!!");
        return candidateList[candidates[winnerAddress]];
    }


}
