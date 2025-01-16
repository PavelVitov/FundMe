// SPDX-License-Idenfier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script{
    uint256 constant SEND_VALUE = 1 ether;    
    function fundFundMe(address mostRecentDeplpoyed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeplpoyed)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
    }
    function run() external{
        address mosRecentDeplpyment = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);

        vm.startBroadcast();
        fundFundMe(mosRecentDeplpyment);
        vm.stopBroadcast();
    }
}

contract WithdrawFundMe is Script{
 uint256 constant SEND_VALUE = 1 ether;    
    function withdrawFundMe(address mostRecentDeplpoyed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeplpoyed)).withdraw();
        vm.stopBroadcast();
    }
    function run() external{
        address mosRecentDeplpyment = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
        
        withdrawFundMe(mosRecentDeplpyment);
    }
}