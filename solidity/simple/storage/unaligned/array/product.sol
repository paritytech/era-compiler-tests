//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         { "method": "setStorage" },
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

    function main(uint16 argument) public returns(uint16) {
        uint16 product = 1;
        for (uint8 i = 0; i < 4; i++) {
            product *= data[i];
        }
        return product;
    }

    function setStorage() public {
        data[0] = 5;
        data[1] = 10;
        data[2] = 15;
        data[3] = 20;
    }
}
