**Voting System Contract**
Overview
  The VotingSystem contract allows users to register candidates, vote for them, and view vote counts. Voters can only vote once.
Functions
  1. registerCandidate(string memory _name)
    Purpose: Register a new candidate.
    Input: Candidate's name (string).
  2. vote(uint _candidateId)
    Purpose: Cast a vote for a candidate.
    Input: Candidate ID (uint).
  3. getVoteCount(uint _candidateId) public view returns (uint)
    Purpose: Get the number of votes for a candidate.
    Input: Candidate ID (uint).
Errors
  VoteAlreadyCast: Thrown if a user tries to vote more than once.
  CandidateNotFound: Thrown if the candidate ID is invalid.
Events
  VoteCasted: Emitted when a vote is cast.
Requirements
  Solidity version ^0.8.28.
  Ethereum network.
