// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../src/TrustBadgeNFT.sol";

contract OnchainResume {

TrustBadgeNFT public BadgeNFT;

error NotBadgeHolder();
error AlreadyEndorsed();

constructor (address _nftAddress){
BadgeNFT = TrustBadgeNFT (_nftAddress);
}

// This is for inputing experience for the resume holder
struct Experience {
    string company;
    string role;
    string description;
    uint256 startDate; // <-- User provides it
    uint256 endDate;   // Optional
}

struct Endorsement {
    address endorser;
    uint64 timestamp;
}

mapping(address => Endorsement[]) public endorsementsReceived;

//Tracks if an endorser has already endorsed a user
mapping (address => mapping (address => bool)) public hasEndorsed;

//experience tracking per user
mapping (address => Experience[]) public experiencetracker;

// No of stars = experience a user has received
mapping (address => uint) public reputation;

event Endorsed(address sender, address recipient, bool success);
event experienceAdded(string role);

function addExperience (string calldata _role, string calldata _company, string calldata _description, uint _startDate, uint _endDate) external {
require (bytes(_role).length <= 64, "Role too long");
require (bytes (_company).length <= 64, "Company details too long");
require (bytes ( _description).length <= 256, "Description too long");

experiencetracker[msg.sender] .push (Experience ({
    company: _company,
    role: _role,
    description: _description,
    startDate: _startDate,
    endDate: _endDate
    }));

    emit experienceAdded (_role);
}

function endorse (address _recipient) public {
    if (BadgeNFT.balanceOf(msg.sender) < 1) revert NotBadgeHolder ();
    if (hasEndorsed[msg.sender][_recipient]) revert AlreadyEndorsed ();

    hasEndorsed[msg.sender][_recipient] = true;

    endorsementsReceived[_recipient].push(
    Endorsement({
        endorser: msg.sender,
        timestamp: uint64(block.timestamp)
    })
);

    reputation[_recipient] += 1;

    emit Endorsed (msg.sender, _recipient, true);


}

function getRecentExperience (address _user) public view  returns (Experience[] memory) {
    Experience[] memory  allExperience = experiencetracker[_user];
    uint len = allExperience.length;

    uint count;
    if (len > 3){
        count = 3;
    } else {
        count = len;
    }

    Experience[] memory recentExperiences = new Experience[](count);
    for (uint i = 0; i < count; i++){
        recentExperiences[i] = allExperience[len-count+i];
    }
    return recentExperiences;
}

 

function getRecentEndorsements(address _user) public view returns (Endorsement[] memory) {
    Endorsement[] memory allEndorsements = endorsementsReceived[_user];
    uint len = allEndorsements.length;
    
    uint count;
      if (len > 5) {
            count = 5;
            } else {
      count = len;
    }

 Endorsement[] memory recentEndorsements = new Endorsement[](count);
    for (uint i = 0; i < count; i++) {
        recentEndorsements[i] = allEndorsements[len - count + i];
    }

    return recentEndorsements;
}


}
 