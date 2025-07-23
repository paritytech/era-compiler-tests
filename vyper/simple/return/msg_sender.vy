#!{
#!    "modes": [
#!        "V >=0.4.0"
#!    ],
#!    "cases": [
#!        {
#!            "name": "without_argument",
#!            "inputs": [
#!                {
#!                    "method": "main()",
#!                    "caller": "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf",
#!                    "calldata": []
#!                }
#!            ],
#!            "expected": [
#!                "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf"
#!            ]
#!        },
#!        {
#!            "name": "with_argument",
#!            "inputs": [
#!                {
#!                    "method": "main(address)",
#!                    "calldata": [
#!                        "0xdeadbeef00000000000000000000000000000042"
#!                    ]
#!                }
#!            ],
#!            "expected": [
#!                "0xdeadbeef00000000000000000000000000000042"
#!            ]
#!        }
#!    ]
#!}

# Report https://linear.app/matterlabs/issue/CPR-500/floating-bug-with-a-default-value-for-the-parameter-as-msgsender

@external
def main(
    a: address = msg.sender,
) -> address:
    return a