// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "src/TokenStringUriRegistry.sol";

contract Uri is Test {
    // Setup
    uint256 constant FORK_BLOCK_NUMBER = 17149178; // All tests executed at this block
    string MAINNET_RPC_URL = "MAINNET_RPC_URL";
    uint256 forkId =
        vm.createSelectFork(vm.envString(MAINNET_RPC_URL), FORK_BLOCK_NUMBER);

    // Mainnet addresses
    address owner = address(0xAF28bcB48C40dBC86f52D459A6562F658fc94B1e);
    IJBProjects public projects = IJBProjects(0xD8B4359143eda5B2d763E127Ed27c77addBc47d3);
    IJBOperatorStore public operatorStore = IJBOperatorStore(0x6F3C5afCa0c9eDf3926eF2dDF17c8ae6391afEfb);

    // Deploy contract
    TokenStringUriRegistry reg = new TokenStringUriRegistry(projects, operatorStore);
    
    // function setUp() public {}

    function testGetUri() public {
        string memory x = reg.getUri(1);
        assertEq(x, "");
    }

    function testSetUriAsOwner() public {
        vm.startPrank(owner);
        reg.setUri(1, "ipfs://xyz");
    }

    //    function testSetUriAsNotOwner() public {

    // }
}
