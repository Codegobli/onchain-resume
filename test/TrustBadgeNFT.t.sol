// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/TrustBadgeNFT.sol";

contract TrustBadgeNFTTest is Test {

TrustBadgeNFT public nft;
address owner;

function setUp() public {
owner = address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
nft = new TrustBadgeNFT(owner);
vm.prank(owner);
nft.mint(owner);
}

function testOwnerHasNft() public view {
    uint balance = nft.balanceOf(owner);
    assertEq(balance, 1);
}




}