// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "src/MyTokenResolver.sol";

contract CounterScript is Script {
    string private _uri = "ipfs://...";

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("MAINNET_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        MyTokenResolver myTokenResolver = new MyTokenResolver(_uri);
        vm.stopBroadcast();
    }
}
