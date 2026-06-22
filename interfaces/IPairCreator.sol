// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.28;

interface IPairCreator {
    function createPair(
        address tokenA,
        address tokenB,
        uint256 amountA,
        uint256 amountB
    ) external returns (address pair);
}
