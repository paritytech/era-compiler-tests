//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         {
//!             "method": "#deployer",
//!             "instance": "Test",
//!             "calldata": [
//!                 "20", 
//!                 "15", 
//!                 "10", 
//!                 "5"
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
    uint256[4] data;

    constructor(uint256 a, uint256 b, uint256 c, uint256 d) {
        data[0] = a;
        data[1] = b;
        data[2] = c;
        data[3] = d;
    }

    function main(uint8 argument) public returns(uint8) {
        uint8 sum = 0;
        for (uint8 i = 0; i < 4; i++) {
            sum += uint8(data[i]);
        }
        return sum;
    }
}
