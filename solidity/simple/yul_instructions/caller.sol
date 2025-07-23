//!{
//!    "cases": [
//!        {
//!            "name": "zero",
//!            "inputs": [
//!                {
//!                    "method": "main",
//!                    "calldata": [],
//!                    "caller": "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf"
//!                }
//!            ],
//!            "expected": [
//!                "0"
//!            ]
//!        },
//!        {
//!            "name": "one",
//!            "inputs": [
//!                {
//!                    "method": "main",
//!                    "calldata": [],
//!                    "caller": "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf"
//!                }
//!            ],
//!            "expected": [
//!                "1"
//!            ]
//!        },
//!        {
//!            "name": "ordinar",
//!            "inputs": [
//!                {
//!                    "method": "main",
//!                    "calldata": [],
//!                    "caller": "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf"
//!                }
//!            ],
//!            "expected": [
//!                "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf"
//!            ]
//!        },
//!        {
//!            "name": "max",
//!            "inputs": [
//!                {
//!                    "method": "main",
//!                    "calldata": [],
//!                    "caller": "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf"
//!                }
//!            ],
//!            "expected": [
//!                "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf"
//!            ]
//!        }
//!    ]
//!}

// SPDX-License-Identifier: MIT

pragma solidity >=0.4.16;

contract Test {
    function main() external payable returns(uint256 result) {
        assembly {
            result := caller()
        }
    }
}
