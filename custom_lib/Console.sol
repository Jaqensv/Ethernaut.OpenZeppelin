// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

contract Console {
    event LogString(string);
    event LogUint(string, uint256);
    event LogAddress(string, address);
    event LogBool(string, bool);

    function log(string memory message) internal {
        emit LogString(message);
    }

    function log(string memory label, uint256 value) internal {
        emit LogUint(label, value);
    }

    function log(string memory label, address value) internal {
        emit LogAddress(label, value);
    }

    function log(string memory label, bool value) internal {
        emit LogBool(label, value);
    }
}
