# ERC-20 Token Smart Contract

The Solidity smart contract for an ERC-20 token is a simple one. On the Ethereum network, the contract lets users design and control their own unique token. As is common for fungible tokens, the token complies with the ERC-20 standard.

## Table of Contents

- [Token Details](#token-details)
- [Token Functions](#token-functions)
- [Deployment and Interactions](#deployment-and-interactions)
- [License](#license)


## Token Details

The ERC-20 token has the following details:

- **Name**: ERC20TOKEN
- **logo**: ERT
- **get_Decimals**: 18
- **overallSupply**: 1,000,000 tokens (1000000 * 10^18 with 18 decimals)

## Token Functions

The ERC-20 token smart contract provides the following functions:

### 1. `minting(address _to, uint _amount)`

The contract owner can use this function to create new tokens and allocate them to a certain address. This function can only be called by the contract owner.

### 2. `burn(uint _amount)`

Any token holder can burn (destroy) their own tokens with this function. When tokens are taken out of circulation, the overall quantity also drops.

### 3. `transfering(address _to, uint _amount)`

Users can move tokens to a different address using this feature. To complete the transfer, the caller needs to have enough balance.

## Deployment and Interactions

To deploy and interact with the ERC-20 token smart contract, you can follow these steps:

1.Utilizing your choice deployment tool (e.g., Remix, HardHat, Truffle), deploy the contract to an Ethereum network.

2. You will receive the contract address following deployment. On the blockchain, this address stands in for your token contract.

3. You can interact with the contract using the provided functions. For example:
   - Call the `minting` function to create and assign new tokens to a specified address.
   - Call the `burn` function to burn a certain amount of your own tokens.
   - Call the `transfering` function to send tokens to another address.

4. Make sure you have sufficient gas and appropriate permissions (e.g., contract ownership) to execute certain functions.

## License

This ERC-20 token smart contract is open-source and licensed under the MIT License. You can freely use, modify, and distribute it as per the terms of the MIT License.
