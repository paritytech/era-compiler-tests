//!{
//!    "cases": [
//!        {
//!            "name": "without_argument",
//!            "inputs": [
//!                {
//!                    "method": "main()",
//!                    "caller": "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf",
//!                    "calldata": []
//!                }
//!            ],
//!            "expected": [
//!                "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf"
//!            ]
//!        },
//!        {
//!            "name": "with_argument",
//!            "inputs": [
//!                {
//!                    "method": "main(address)",
//!                    "calldata": [
//!                        "0xdeadbeef00000000000000000000000000000042"
//!                    ]
//!                }
//!            ],
//!            "expected": [
//!                "0xdeadbeef00000000000000000000000000000042"
//!            ]
//!        }
//!    ]
//!}

// SPDX-License-Identifier: MIT

// Report https://linear.app/matterlabs/issue/CPR-500/floating-bug-with-a-default-value-for-the-parameter-as-msgsender

pragma solidity >=0.4.16;

contract Test {
    function main(address a) public returns(address) {
        return a;
    }
    function main() external returns(address) {
        return main(msg.sender);
    }
}
