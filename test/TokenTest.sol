// SPDX-Licence-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/IToken.sol";

contract Attacker is Test {
    Token instance = Token(payable(0xa4516EF85aA1c5D81988c82ccDE5192f0c4EaD25));
    function test() external {
        console.log(instance.balanceOf(msg.sender));
    }
}