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

struct Experience {

string title;
uint32 timestamp;

}

//Tracks if an endorser has already endorsed a user
mapping (address => mapping (address => bool)) public hasEndorsed;

//experience tracking per user
mapping (address => Experience[]) public experiencetracker;

// No of stars = experience a user has received
mapping (address => uint) public reputation;

event Endorsed(address sender, address recipient, bool success);

function addExperience ( string calldata _title) external {
    experiencetracker[msg.sender] .push (Experience ({
        title: _title,
        timestamp: uint32(block.timestamp)
    }));
}

function endorse (address _recipient) public {
    if (BadgeNFT.balanceOf(msg.sender) < 1) revert NotBadgeHolder ();
    if (hasEndorsed[msg.sender][_recipient]) revert AlreadyEndorsed ();

    hasEndorsed[msg.sender][_recipient] = true;
    reputation[_recipient] += 1;

    emit Endorsed (msg.sender, _recipient, true);


}

}
 