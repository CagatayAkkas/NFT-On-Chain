// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    string public constant TOKEN_URI =
        "ipfs://bafybeigy3zzepamu4qhsoo7f672zudricdkw2chqhj3rh7no5cnvqmuuum/";
    uint256 private s_tokenCounter;

    constructor() ERC721("gs", "GS") {
        s_tokenCounter = 0;
    }

    function mintNft() public {
        s_tokenCounter = s_tokenCounter + 1;
        _safeMint(msg.sender, s_tokenCounter);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        // require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return TOKEN_URI;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
