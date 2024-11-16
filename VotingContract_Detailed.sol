// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingContract {
    // Struct representing each candidate
    struct Candidate {
        string name;   // Name of the candidate
        uint voteCount; // Number of votes received
    }

    // Mapping to keep track of addresses that have voted
    mapping(address => bool) public hasVoted;

    // Array to store candidates
    Candidate[] public candidates;

    // Constructor to initialize candidates
    constructor(string[] memory candidateNames) {
        for (uint i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate({
                name: candidateNames[i],
                voteCount: 0
            }));
        }
    }

    // Function to cast a vote for a candidate by index
    function vote(uint candidateIndex) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(candidateIndex < candidates.length, "Invalid candidate.");

        candidates[candidateIndex].voteCount += 1;
        hasVoted[msg.sender] = true;
    }

    // Function to get the list of all candidates
    function getCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }
}
