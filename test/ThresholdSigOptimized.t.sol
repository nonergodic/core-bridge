// SPDX-License-Identifier: Apache 2

pragma solidity ^0.8.24;

import { ManualSigning } from "./ManualSigning.sol";

import { ThresholdSigOptimized } from "core-bridge/ThresholdSigOptimized.sol";
import "wormhole-sdk/proxy/Proxy.sol";

contract ThresholdSigOptimizedGasCost is ManualSigning {
  ThresholdSigOptimized private _thresholdSigOptimized;
  ThresholdSigOptimized private _thresholdSigOptimizedProxied;

  function setUp() public {
    _setUpManualSigning(1);
    _thresholdSigOptimized = new ThresholdSigOptimized();
    bytes memory encodedAddress = abi.encode(_guardianAddrs[0]);
    _thresholdSigOptimized.checkedUpgrade(encodedAddress);

    _thresholdSigOptimizedProxied = ThresholdSigOptimized(payable(address(new Proxy(
      address(_thresholdSigOptimized),
      encodedAddress
    ))));
  }

  function testThresholdSigOptimizations() public view {
    _thresholdSigOptimized.parseAndVerifyVMThreshold(_vaa);
  }

  function testThresholdSigOptimizationsProxied() public view {
    _thresholdSigOptimizedProxied.parseAndVerifyVMThreshold(_vaa);
  }
}