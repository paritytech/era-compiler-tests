//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         {
//!             "method": "main",
//!             "calldata": [
//!                 "12"
//!             ]
//!         }
//!     ],
//!     "expected": [
//!         "42"
//!     ]
//! } ] }

// SPDX-License-Identifier: MIT

pragma solidity >=0.4.16;

contract Test {
    uint256 field_1;
    uint256 field_2;
    uint256 field_3;

    function main(uint8 witness) public returns(uint8) {
        return witness + uint8(field_1) * uint8(field_2) * uint8(field_3);
    }

    constructor() {
        field_1 = 3;
        field_2 = 5;
        field_3 = 2;
    }
}
