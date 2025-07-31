//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         {
//!             "method": "setStorage",
//!             "calldata": [
//!                 "5",
//!                 "7"
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
//!         "148"
//!     ]
//! } ] }

// SPDX-License-Identifier: MIT

pragma solidity >=0.4.19;
pragma experimental ABIEncoderV2;

contract Test {
    uint248 constant SOMETHING = 42;
    uint248 constant SOMETHING_ELSE = 88;

    struct Data {
        uint248 c;
        uint248 d;
    }

    uint248 a;
    uint248 b;

    function setStorage(uint256 a, uint256 b) public {
        assembly {
            sstore(0, a)
            sstore(1, b)
        }
    }

    function main(uint248 value) public returns(uint248) {
        Data memory data = Data(10, 20);

        return inner(data, value, 42);
    }

    function inner(Data memory data, uint248 value, uint8 literal) public returns(uint248) {
        return ((a + data.c + b + data.d + value) * uint248(literal) * SOMETHING - SOMETHING_ELSE) / 1000;
    }
}
