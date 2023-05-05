// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "src/IPFSTokenResolverRegistry.sol";

contract CounterScript is Script {
    IJBProjects public projects =
        IJBProjects(0xD8B4359143eda5B2d763E127Ed27c77addBc47d3);
    IJBOperatorStore public operatorStore =
        IJBOperatorStore(0x6F3C5afCa0c9eDf3926eF2dDF17c8ae6391afEfb);

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("MAINNET_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        IPFSTokenResolverRegistry tokenResolver = new IPFSTokenResolverRegistry(
            projects,
            operatorStore
        );
        vm.stopBroadcast();
    }
}
