//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         {
//!             "method": "setStorage",
//!             "calldata": [
//!                 "0x0000000000000000000000000000000000000000000000000005000a000f0014"
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
//!         "15000"
//!     ]
//! } ] }

contract Test {
    uint16[4] data;

    function setStorage(bytes32 newStorage) public {
        assembly {
            sstore(0, newStorage)
        }
    }

    function main(uint16 argument) public returns(uint16) {
        uint16 product = 1;
        for (uint8 i = 0; i < 4; i++) {
            product *= data[i];
        }
        return product;
    }
}
