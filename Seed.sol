// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

interface IModel {
    function calculate_state(uint256, uint256) external pure returns(state memory);

    struct state {
        uint week;
        uint day;
        uint hour;
        uint minute;
        uint second;
    }
}

interface IVisualize {
    function visualize_state(IModel.state memory) external pure returns(string memory);
}

contract Seed {

    uint256 time_stamp;

    address owner;

    IModel model;

    IVisualize visualize;

    constructor(IModel _model, IVisualize _visualize) {

        model = _model;
        visualize = _visualize;
        owner = msg.sender;
        time_stamp = block.timestamp;
    }

    function get_state() public view returns(IModel.state memory) {

        return model.calculate_state(time_stamp, block.timestamp);
    }

    function get_value() public view returns(string memory) {

        return visualize.visualize_state(
            model.calculate_state(
                time_stamp,
                block.timestamp));
    }

    function switch_visualize(IVisualize _visualize) public {
        require(msg.sender == owner, "Only owner!");

        visualize = _visualize;
    }
}
