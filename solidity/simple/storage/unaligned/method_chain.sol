//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         {
//!             "method": "setStorage",
//!             "calldata": [
//!                 "0",
//!                 "5"
//!             ]
//!         },
//!         {
//!             "method": "setStorage",
//!             "calldata": [
//!                 "1",
//!                 "11"
//!             ]
//!         },
//!         {
//!             "method": "main",
//!             "calldata": [
//!                 "42"
//!             ]
//!         }
//!     ],
//!     "expected": [
//!         "1024"
//!     ]
//! } ] }

// SPDX-License-Identifier: MIT

pragma solidity >=0.4.16;

contract Test {
    uint248 a;
    uint248 b;

    function setStorage(uint256 idx, uint256 newStorage) public {
        assembly {
            sstore(idx, newStorage)
        }
    }

    function main(uint248 value) public returns(uint248) {
        return a + quadruple(triple(double(value))) + b;
    }

    function double(uint248 value) public returns(uint248) {
        return value * 2;
    }

    function triple(uint248 value) public returns(uint248) {
        return 3 * value;
    }

    function quadruple(uint248 value) public returns(uint248) {
        return value * 4;
    }
}
