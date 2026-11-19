// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";

contract DeployMyToken is Script {
    function run() external {
        vm.startBroadcast();
        new MyToken("My Token", "NWD", 1000000 ether);
        vm.stopBroadcast();
    }

    
}