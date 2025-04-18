// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

contract Test {
    event Log(string message);
    event LogUint(string message, uint256 value);
    event LogAddress(string message, address value);

    function assertTrue(bool condition) internal {
        if (!condition) {
            emit Log("Assertion failed: condition is false");
            revert("assertTrue failed");
        }
    }

    function assertEq(uint256 a, uint256 b) internal {
        if (a != b) {
            emit Log("Assertion failed: a != b");
            revert("assertEq failed");
        }
    }

    function assertEq(address a, address b) internal {
        if (a != b) {
            emit Log("Assertion failed: address mismatch");
            revert("assertEq failed");
        }
    }

    function fail() internal pure {
        require(false, "fail() called");
    }
}
