pragma solidity ^0.8.28;

// Define custom errors for specific failure cases
error CandidateNotFound(uint candidateId);
error VoteAlreadyCast(address voter);

// Contract definition
contract VotingSystem {
    struct Candidate {
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public hasVoted;

    uint public candidatesCount;

    event VoteCasted(address voter, uint candidateId);

    // Function to register a new candidate
    function registerCandidate(string memory _name) public {
        candidates[++candidatesCount] = Candidate(_name, 0);

        assert(candidatesCount > 0);
    }

    // Function to allow a user to cast a vote
    function vote(uint _candidateId) public {
        if (hasVoted[msg.sender]) revert VoteAlreadyCast(msg.sender);
        if (_candidateId == 0 || _candidateId > candidatesCount) revert CandidateNotFound(_candidateId);
        hasVoted[msg.sender] = true;
        candidates[_candidateId].voteCount++;
        emit VoteCasted(msg.sender, _candidateId);
    }

    // Function to retrieve the vote count for a specific candidate
    function getVoteCount(uint _candidateId) public view returns (uint) {
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Candidate not found");

        return candidates[_candidateId].voteCount;
    }
}
