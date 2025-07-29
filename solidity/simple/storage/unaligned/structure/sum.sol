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
    uint8 constant TEST = 42;

    struct Data {
        uint8 a;
        uint8 b;
        uint8 c;
        uint8 d;
    }

    Data data;

    function main(uint8 argument) public returns(uint8) {
        uint8 sum = 0;
        sum += data.a;
        sum += data.b;
        sum += data.c;
        sum += data.d;
        return sum;
    }

    function setStorage() public {
        data.a = 5;
        data.b = 10;
        data.c = 15;
        data.d = 20;
    }
}
