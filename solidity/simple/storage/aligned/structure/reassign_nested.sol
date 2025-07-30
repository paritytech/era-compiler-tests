//! { "cases": [ {
//!     "name": "main",
//!     "inputs": [
//!         {
//!             "method": "#deployer",
//!             "instance": "Test",
//!             "calldata": [
//!                 "99", 
//!                 "100", 
//!                 "101"
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
//!         "226"
//!     ]
//! } ] }

contract Test {
    uint8 constant TEST = 42;

    struct Data {
        Inner inner;
    }

    struct Inner {
        uint256 value;
        uint256 next;
        uint256 last;
    }

    Data data;

    constructor(uint256 value, uint256 next, uint256 last) {
        data.inner.value = value;
        data.inner.next = next;
        data.inner.last = last;
    }

    function main(uint8 argument) public returns(uint8) {
        data.inner.next += uint256(argument);

        return argument + TEST + uint8(data.inner.next);
    }
}
