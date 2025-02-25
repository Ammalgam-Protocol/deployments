# Ammalgam Deployments
Latest `core-v1` and `peripheral` contract deployed addresses, ABIs and interfaces

## Sepolia

### v0.7.1-alpha

| Name                            | Address                                                                                      | Interface |
|---------------------------------|--------------------------------------------------------------------------------------------| ------------- |
| Ammalgam Factory               | [`0xBd68dbE675d0d1108af3aEbC5F7724Cf31c82E9a`](https://sepolia.etherscan.io/address/0xBd68dbE675d0d1108af3aEbC5F7724Cf31c82E9a) | [IAmmalgamFactory](./interfaces/factories/IAmmalgamFactory.sol)
| Ammalgam Peripheral            | [`0x65dfBe3f4ebaEE887D0188fB42c674Cf6087b0FE`](https://sepolia.etherscan.io/address/0x65dfBe3f4ebaEE887D0188fB42c674Cf6087b0FE) | [IPeripheral](./interfaces/IPeripheral.sol)

This repo contains the `interfaces` for the `core-v1` contracts of the Ammalgam Protocol. We will be exposing more once we have completed audits and are closer to launching.

The main two contracts are the [IAmmalgamFactory](./interfaces/factories/IAmmalgamFactory.sol) and the [IAmmalgamPair](./interfaces/IAmmalgamPair.sol). These work similarly
to the Uniswap V2 Factory and Pair. Note that the `IAmmalgamPair` inherits the [ITokenController](./interfaces/tokens/ITokenController.sol) which exposes additional information
about the pair.

The pair mints 6 different tokens for each possible position, mint L, deposit X or Y, borrow X or Y, and borrow L. Each token type can be found in the [tokens folder](./interfaces/tokens).

The [IAmmalgamCallee](./interfaces/callbacks/IAmmalgamCallee.sol) can be used to run operations in the middle of the `swap`, `borrow`, and `borrowLiqudity` calls in the Ammalgam Pair.

If you have additional questions please reach out in Discord, and we will attempt to help. 