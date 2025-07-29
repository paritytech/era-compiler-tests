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
//!         "126"
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

    function main(uint8 argument) public returns(uint8) {
        data.inner.next = uint256(argument);

        return argument + TEST + uint8(data.inner.next);
    }

    function setStorage() public {
        data.inner.value = 99;
        data.inner.next = 100;
        data.inner.last = 101;
    }
}
