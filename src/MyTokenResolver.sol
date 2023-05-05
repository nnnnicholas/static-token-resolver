// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {IJBTokenUriResolver} from "@jbx-protocol/juice-contracts-v3/contracts/interfaces/IJBTokenUriResolver.sol";

contract MyTokenResolver is IJBTokenUriResolver {

    string public uri;

    constructor(string memory  _uri) {
        uri = _uri;
    }
    
    function getUri(uint256 _projectId) external view returns (string memory tokenUri) {
        return uri;
    }
}
