// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {IJBTokenUriResolver} from "@jbx-protocol/juice-contracts-v3/contracts/interfaces/IJBTokenUriResolver.sol";
import {JBOperatable, IJBOperatorStore} from "@jbx-protocol/juice-contracts-v3/contracts/abstract/JBOperatable.sol";
import {IJBProjects} from "@jbx-protocol/juice-contracts-v3/contracts/interfaces/IJBProjects.sol";


contract IPFSTokenResolverRegistry is IJBTokenUriResolver, JBOperatable {

    /**
     * @notice Emitted when the IPFS for a project is set.
     */
    event ProjectTokenUriResolverSet(uint256 indexed projectId, string indexed ipfs);


    IJBProjects public immutable projects;
    uint public constant SET_TOKEN_URI = 20;
    string[] public uri;

    constructor(IJBProjects _projects, IJBOperatorStore _operatorStore) JBOperatable(_operatorStore) {
        projects = _projects;
    }

    function getUri(
        uint256 _projectId
    ) external view returns (string memory tokenUri) {
        return uri[_projectId];
    }

    function setUri(
        uint256 _projectId,
        string memory _uri
    )
        external
        requirePermission(
            projects.ownerOf(_projectId),
            _projectId,
            SET_TOKEN_URI
        )
    {
        uri[_projectId] = _uri;
        emit ProjectTokenUriResolverSet(_projectId, _uri);
    }
}
