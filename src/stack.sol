pragma solidity 0.8.17;

contract Stack {
    uint256[] stack;
    uint256 constant private max_depth = 1024;

    error invalidStackItem();
    error stackOverflow();

    function push(uint256 item) external {
        if(item < 0 || item > type(uint256).max - 1) revert invalidStackItem();

        if(stack.length > max_depth) revert stackOverflow();

        stack.push(item);
    }

    function pop() external view returns(uint256) {
        uint256 item = stack[stack.length - 1];
        if(stack.length < 0) revert stackOverflow();

        return item;
    }
}