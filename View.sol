// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/utils/Strings.sol";
import "./Seed.sol";


contract VisualizeToSVG is IVisualize{
    
    function visualize_state(IModel.state memory state) external pure returns(string memory){
        // head
        string memory body = "<svg width=\"250\" height=\"220\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><style>.base{font:700 40px sans-serif;fill:#3cbae8}.number{font:700 40px sans-serif;fill:#EBAEA9}</style><text x=\"45\" y=\"40\" font-size=\"54px\" fill=\"#ff4f4f\" >Passed </text>";

        // weeks
        body = string.concat(body, "<text x=\"10\" y=\"75\" class=\"base\">Weeks </text><text x=\"140\" y=\"75\" class=\"number\">");
        body = string.concat(body, Strings.toString(state.week));

        // days
        body = string.concat(body, "</text><text x=\"10\" y=\"110\" class=\"base\">Days </text><text x=\"110\" y=\"110\" class=\"number\">");
        body = string.concat(body, Strings.toString(state.day));

        // hours
        body = string.concat(body, "</text><text x=\"10\" y=\"145\" class=\"base\">Hours </text><text x=\"130\" y=\"145\" class=\"number\">");
        body = string.concat(body, Strings.toString(state.hour));
        
        // minutes
        body = string.concat(body, "</text><text x=\"10\" y=\"180\" class=\"base\">Minutes </text><text x=\"165\" y=\"180\" class=\"number\">");
        body = string.concat(body, Strings.toString(state.minute));

        // seconds
        body = string.concat(body, "</text><text x=\"10\" y=\"215\" class=\"base\">Seconds </text><text x=\"180\" y=\"215\" class=\"number\">");
        body = string.concat(body, Strings.toString(state.second));


        return string.concat(body, "</text></svg>");
    }
}


contract VisualizeToString is IVisualize {
    function visualize_state(IModel.state memory _state) external pure returns(string memory) {

        // Weeks
        string memory body = "Weeks - ";
        body = string.concat(body, Strings.toString(_state.week));
        body = string.concat(body, "; ");

        // Days
        body = string.concat(body, "Days - ");
        body = string.concat(body, Strings.toString(_state.day));
        body = string.concat(body, "; ");

        // Hours
        body = string.concat(body, "Hours - ");
        body = string.concat(body, Strings.toString(_state.hour));
        body = string.concat(body, "; ");

        // Minutes
        body = string.concat(body, "Minutes - ");
        body = string.concat(body, Strings.toString(_state.minute));
        body = string.concat(body, "; ");

        // Seconds    
        body = string.concat(body, "Seconds - ");
        body = string.concat(body, Strings.toString(_state.second));
        body = string.concat(body, "; ");


        return body;
    }
}