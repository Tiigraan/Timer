// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

import "./Seed.sol";

contract Model is IModel {
    function calculate_state(uint256 time_stamp, uint256 time_now) external pure returns(IModel.state memory) {
        uint256 time = time_now - time_stamp;

        uint256 week = time / 1 weeks;
        time -= week * 1 weeks;

        uint256 day = time / 1 days;
        time -= day * 1 days;

        uint256 hour = time / 1 hours;
        time -= hour * 1 hours;

        uint256 minute = time / 1 minutes;
        time -= minute * 1 minutes;

        uint256 second = time;

        return state(week, day, hour, minute, second);
    }
}