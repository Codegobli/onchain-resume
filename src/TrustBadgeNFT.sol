// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import  "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TrustBadgeNFT is ERC721, Ownable {
    uint256 public nextTokenId;

   constructor(address initialOwner) ERC721("Trust Badge", "TRUST") Ownable(initialOwner) {
        // mint logic here
    }

    function mint(address to) external onlyOwner {
        _safeMint(to, nextTokenId);
        nextTokenId++;
    }
}
