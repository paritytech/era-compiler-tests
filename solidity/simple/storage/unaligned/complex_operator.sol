//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         {
//!             "method": "setStorage",
//!             "calldata": [
//!                 "0x0000000000000000000000000000000000000000000000000000000000020503"
//!             ]
//!         },
//!         {
//!             "method": "main",
//!             "calldata": [
//!                 "16"
//!             ]
//!         }
//!     ],
//!     "expected": [
//!         "81"
//!     ]
//! } ] }

// SPDX-License-Identifier: MIT

pragma solidity >=0.4.16;

contract Test {
    uint8 field_1;
    uint8 field_2;
    uint8 field_3;

    function setStorage(bytes32 newStorage) public {
        assembly {
            sstore(0, newStorage)
        }
    }

    function main(uint8 witness) public returns(uint8) {
        return 19 * 3 - 8 / field_1 + (witness / (field_2 - 3) + 5) * (8 / field_3 / 2);
    }
}
