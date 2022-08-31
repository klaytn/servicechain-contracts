// SPDX-License-Identifier: MIT

// Copyright 2019 The klaytn Authors
// This file is part of the klaytn library.
//
// The klaytn library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The klaytn library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the klaytn library. If not, see <http://www.gnu.org/licenses/>.

pragma solidity ^0.8.0;

import "@klaytn/contracts/token/ERC20/IERC20.sol";

abstract contract BridgeFee {
    address payable public feeReceiver = payable(address(0));
    uint256 public feeOfKLAY = 0;
    mapping (address => uint256) public feeOfERC20;

    event KLAYFeeChanged(uint256 indexed fee);
    event ERC20FeeChanged(address indexed token, uint256 indexed fee);
    event FeeReceiverChanged(address indexed feeReceiver);

    constructor(address payable _feeReceiver) {
        feeReceiver = _feeReceiver;
    }

    function _payKLAYFeeAndRefundChange(uint256 _feeLimit) internal returns(uint256) {
        uint256 fee = feeOfKLAY;

        if (feeReceiver != address(0) && fee > 0) {
            require(_feeLimit >= fee, "insufficient feeLimit");

            feeReceiver.transfer(fee);
            if (_feeLimit - fee > 0) {
               payable(msg.sender).transfer(_feeLimit - fee);
            }

            return fee;
        }

        payable(msg.sender).transfer(_feeLimit);
        return 0;
    }

    function _payERC20FeeAndRefundChange(address from, address _token, uint256 _feeLimit) internal returns(uint256) {
        uint256 fee = feeOfERC20[_token];

        if (feeReceiver != address(0) && fee > 0) {
            require(_feeLimit >= fee, "insufficient feeLimit");

            require(IERC20(_token).transfer(feeReceiver, fee), "_payERC20FeeAndRefundChange: transfer failed");
            if (_feeLimit - fee > 0) {
                require(IERC20(_token).transfer(from, _feeLimit - fee), "_payERC20FeeAndRefundChange: transfer failed");
            }

            return fee;
        }

        require(IERC20(_token).transfer(from, _feeLimit), "_payERC20FeeAndRefundChange: transfer failed");
        return 0;
    }

    function _setKLAYFee(uint256 _fee) internal {
        feeOfKLAY = _fee;
        emit KLAYFeeChanged(_fee);
    }

    function _setERC20Fee(address _token, uint256 _fee) internal {
        feeOfERC20[_token] = _fee;
        emit ERC20FeeChanged(_token, _fee);
    }

    function _setFeeReceiver(address payable _to) internal {
        feeReceiver = _to;
        emit FeeReceiverChanged(_to);
    }
}
