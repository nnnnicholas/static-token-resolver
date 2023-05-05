// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {IJBTokenUriResolver} from "@jbx-protocol/juice-contracts-v3/contracts/interfaces/IJBTokenUriResolver.sol";

contract MyTokenResolver {

    string public uri;

    constructor(string memory  _uri) {
        uri = _uri;
    }
    
    // Note: this function is marked `pure` because it does not mutate chain state. The ERC721 standard uses `view` instead (source: https://eips.ethereum.org/EIPS/eip-721).
    function getUri(uint256 _projectId) external view returns (string memory tokenUri) {
        return uri;
    }
}
