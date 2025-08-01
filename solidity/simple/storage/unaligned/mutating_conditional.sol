//! { "cases": [ {
//!     "name": "false_false",
//!     "inputs": [
//!         {
//!             "method": "setStorage",
//!             "calldata": [
//!                 "42"
//!             ]
//!         },
//!         {
//!             "method": "main",
//!             "calldata": [
//!                 "0",
//!                 "0",
//!                 "25"
//!             ]
//!         }
//!     ],
//!     "expected": [
//!         "42"
//!     ]
//! }, {
//!     "name": "false_true",
//!     "inputs": [
//!         {
//!             "method": "setStorage",
//!             "calldata": [
//!                 "42"
//!             ]
//!         },
//!         {
//!             "method": "main",
//!             "calldata": [
//!                 "0",
//!                 "1",
//!                 "25"
//!             ]
//!         }
//!     ],
//!     "expected": [
//!         "42"
//!     ]
//! }, {
//!     "name": "true_false",
//!     "inputs": [
//!         {
//!             "method": "setStorage",
//!             "calldata": [
//!                 "42"
//!             ]
//!         },
//!         {
//!             "method": "main",
//!             "calldata": [
//!                 "1",
//!                 "0",
//!                 "25"
//!             ]
//!         }
//!     ],
//!     "expected": [
//!         "42"
//!     ]
//! }, {
//!     "name": "true_true",
//!     "inputs": [
//!         {
//!             "method": "setStorage",
//!             "calldata": [
//!                 "42"
//!             ]
//!         },
//!         {
//!             "method": "main",
//!             "calldata": [
//!                 "1",
//!                 "1",
//!                 "25"
//!             ]
//!         }
//!     ],
//!     "expected": [
//!         "25"
//!     ]
//! } ] }

// SPDX-License-Identifier: MIT

pragma solidity >=0.4.16;

contract Test {
    uint8 data;

    function setStorage(uint256 newStorage) public {
        assembly {
            sstore(0, newStorage)
        }
    }

    function main(bool gate_1, bool gate_2, uint8 value) public returns(uint8) {
        if (gate_1) {
            if (gate_2) {
                data = value;
            }
        }

        return data;
    }
}
