pragma solidity 0.8.17;

contract Memory {
    uint256[] memories;

    error InvalidMemoryAccess();
    error InvalidMemoryValue();

    function store(uint256 offset, uint8 value) external {
        if(offset < 0 || offset > type(uint256).max) revert InvalidMemoryAccess();

        if(value < 0 || value > type(uint8).max) revert InvalidMemoryValue();

        // if(offset >= memories.length) {}

        memories[offset] = value;
    }

    function load(uint256 offset) external view returns(uint256) {
        if(offset < 0) revert InvalidMemoryAccess();

        if(offset >= memories.length) return 0;

        return memories[offset];
    }
}