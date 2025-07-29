//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         {
//!             "method": "main",
//!             "calldata": [
//!                 "42"
//!             ]
//!         }
//!     ],
//!     "expected": [
//!         "126"
//!     ]
//! } ] }

contract Test {
    uint8[4] data;

    uint8 constant TEST = 42;

    function main(uint8 argument) public returns(uint8) {
        data[3] = argument;

        return argument + TEST + data[3];
    }

    constructor() {
        data[0] = 1;
        data[1] = 2;
        data[2] = 3;
        data[3] = 4;
    }
}
