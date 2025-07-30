//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         {
//!             "method": "#deployer",
//!             "instance": "Test"
//!         },
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
    uint256[4][4] data;

    uint8 constant TEST = 42;

    constructor() {
        data[0][0] = 1;  data[0][1] = 2;  data[0][2] = 3;  data[0][3] = 4;
        data[1][0] = 5;  data[1][1] = 6;  data[1][2] = 7;  data[1][3] = 8;
        data[2][0] = 9;  data[2][1] = 10; data[2][2] = 11; data[2][3] = 12;
        data[3][0] = 13; data[3][1] = 14; data[3][2] = 15; data[3][3] = 16;
    }

    function main(uint8 argument) public returns(uint8) {
        data[3][3] = uint256(argument);

        return argument + TEST + uint8(data[3][3]);
    }
}
