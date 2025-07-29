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
//!         "50"
//!     ]
//! } ] }

contract Test {
    uint8[4] data;

    function main(uint8 argument) public returns(uint8) {
        uint8 sum = 0;
        for (uint8 i = 0; i < 4; i++) {
            sum += data[i];
        }
        return sum;
    }

    function setStorage() public {
        data[0] = 5;
        data[1] = 10;
        data[2] = 15;
        data[3] = 20;
    }
}
