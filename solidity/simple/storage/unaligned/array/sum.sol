//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         {
//!             "method": "setStorage",
//!             "calldata": [
//!                 "0x00000000000000000000000000000000000000000000000000000000050a0f14"
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
//!         "50"
//!     ]
//! } ] }

contract Test {
    uint8[4] data;

    function setStorage(bytes32 newStorage) public {
        assembly {
            sstore(0, newStorage)
        }
    }

    function main(uint8 argument) public returns(uint8) {
        uint8 sum = 0;
        for (uint8 i = 0; i < 4; i++) {
            sum += data[i];
        }
        return sum;
    }
}
