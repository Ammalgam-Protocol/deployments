// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.28;

import {ICallback} from 'interfaces/callbacks/IAmmalgamCallee.sol';
import {IERC20DebtToken} from 'interfaces/tokens/IERC20DebtToken.sol';

interface IPeripheral {
    function computeExpectedSwapAmountIn(
        uint256 amountOut,
        uint256 reserveIn,
        uint256 reserveOut,
        uint256 missingIn,
        uint256 missingOut
    ) external pure returns (uint256);

    function computeExpectedSwapAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut,
        uint256 missingIn,
        uint256 missingOut
    ) external pure returns (uint256);

    struct PositionParams {
        address pairAddress;
        address from;
        address to;
        uint256 transferX;
        uint256 transferY;
        uint256 mintX;
        uint256 mintY;
        uint256 swapAmountInX;
        uint256 swapAmountInY;
        uint256 swapAmountOutX;
        uint256 swapAmountOutY;
        uint256 borrowLAssets;
    }

    function newPosition(
        PositionParams calldata params
    ) external;

    struct SwapSingleParams {
        address to;
        address tokenIn;
        address tokenOut;
        uint256 amountIn;
        uint256 minAmountOut;
    }

    function swapHelper(
        SwapSingleParams calldata params
    ) external;

    function swapFromNative(
        SwapSingleParams calldata params
    ) external payable;

    function swapToNative(
        SwapSingleParams calldata params
    ) external;

    function createPair(
        address tokenX,
        address tokenY,
        uint256 amountX,
        uint256 amountY
    ) external returns (address pair);

    struct HelperParams {
        address to;
        address pairAddress;
        uint256 amountX;
        uint256 amountY;
    }

    function depositLiquidityHelper(
        HelperParams calldata helperParams
    ) external;

    function depositHelper(
        HelperParams calldata helperParams
    ) external;

    function repayHelper(
        HelperParams calldata helperParams
    ) external;

    function repayLiquidityHelper(
        HelperParams calldata helperParams
    ) external;

    function withdrawHelper(
        HelperParams calldata helperParams
    ) external;

    function withdrawLiquidityHelper(address to, address pairAddress, uint256 amount) external;

    struct ClosePositionInputParams {
        address pairAddress;
        address from;
        uint256 burnL;
        uint256 withdrawX;
        uint256 withdrawY;
    }

    function close(
        ClosePositionInputParams calldata params
    ) external;

    function delegationAllowance(address onBehalfOf, address delegatee) external view returns (bool);

    function approveDelegation(
        address delegatee
    ) external;
}