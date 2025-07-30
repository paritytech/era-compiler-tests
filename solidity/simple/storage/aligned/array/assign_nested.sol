//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         {
//!             "method": "#deployer",
//!             "instance": "Test",
//!             "calldata": [
//!                 "1", "2", "3", "4",
//!                 "5", "6", "7", "8",
//!                 "9", "10", "11", "12",
//!                 "13", "14", "15", "16"
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
//!         "126"
//!     ]
//! } ] }

contract Test {
    uint256[4][4] data;

    uint8 constant TEST = 42;

    constructor(
        uint256 a1, uint256 a2, uint256 a3, uint256 a4,
        uint256 b1, uint256 b2, uint256 b3, uint256 b4,
        uint256 c1, uint256 c2, uint256 c3, uint256 c4,
        uint256 d1, uint256 d2, uint256 d3, uint256 d4
    ) {
        data[0][0] = a1; data[0][1] = a2; data[0][2] = a3; data[0][3] = a4;
        data[1][0] = b1; data[1][1] = b2; data[1][2] = b3; data[1][3] = b4;
        data[2][0] = c1; data[2][1] = c2; data[2][2] = c3; data[2][3] = c4;
        data[3][0] = d1; data[3][1] = d2; data[3][2] = d3; data[3][3] = d4;
    }

    function main(uint8 argument) public returns(uint8) {
        data[3][3] = uint256(argument);

        return argument + TEST + uint8(data[3][3]);
    }
}
