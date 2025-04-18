// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "Console.sol";

contract MyTest is Console {
    function testSomething() public {
        log("Owner is", msg.sender);
        log("Value is", uint256(42));
        log("Status", true);
    }
}
