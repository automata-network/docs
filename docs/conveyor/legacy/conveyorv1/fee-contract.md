# `Fee.sol`

The contract fetches real-time price feed from Chainlink Oracles and converts the gas fee amount to an equivalent token price.

---

## **`admin`**

```solidity
mapping(address => bool) admins;
```
Key-value pair map that keeps track of the contract admin.

|Parameter|Type| |
|---|---|---|
|key|`address`|input addresses|
|value|`bool`|`True:` the address is an admin, `False:` otherwise|

## **`priceContracts`**

```solidity
mapping(bytes => address) public priceContracts;
```
Key-value pair map that stores the address of a Chainlink pricefeed oracle contract.

|Parameter|Type| |
|---|---|---|
|key|`bytes`|The input price feed index, with the format: `<network>-<token>-eth`. For example, to query the USDC/ETH price from the Mainnet, enter `main-usdc-eth`|
|value|`address`|The Chainlink oracle address|

## **`tokensMap`**

```solidity
mapping(address => bytes) public tokensMap;
```
Key-value pair mapping tokens to their contract addresses.

|Parameter|Type| |
|---|---|---|
|key|`address`|The ERC20 token address
|value|`bytes`|The input price feed index, as defined in `priceContracts`|

## **`constructor()`**

```solidity
constructor() public;
```
Assigns the deployer as a default admin, and pre-assigns the following price feed:

- `main-usdc-eth`
- `main-uni-eth`
- `kovan-usdc-eth`

## **`onlyAdmin()`**

```solidity
modifier onlyAdmin();
```
Verifies `msg.sender` is a contract admin.

## **`modifyAdmin()`**

```solidity
function modifyAdmin(address input, bool isAdmin) public onlyAdmin();
```
Adds or removes admin privilege to or from the input address.

|Parameter|Type| |
|---|---|---|
|input|`address`|The input address to be given or revoked admin privilege|
|isAdmin|`bool`|`true`: assigns admin, `false`: revokes admin|

## **`addPriceFeed()`**

```solidity
function addPriceFeed(
    string memory priceIndex, 
    address feed, 
    address token
) public onlyAdmin();
```
Adds a new price feed, then maps to the token address. It can only be invoked by an admin.
To find more oracle addresses, check out the Chainlink [docs](https://docs.chain.link/docs/reference-contracts/).

|Parameter|Type| |
|---|---|---|
|priceIndex|`string`|The input price feed index, as defined in `priceContracts`|
|feed|`address`|The address of the Chainlink price feed|
|token|`address`|The ERC20 token address|

## **`gasPrice()`**

```solidity
function getPrice(address token) public view returns (int256);
```
Gets the real time price data from Chainlink in 18 decimals.

|Parameter|Type| |
|---|---|---|
|token|`address`|The ERC20 Token address|

## **`calculateGasInTokens()`**

```solidity
function calculateGasInTokens(
    address token, 
    uint256 gas, 
    uint256 weiPerToken
) public view returns (uint256)
```
Returns the amount of tokens equivalent to the gas fee.

|Parameter|Type| |
|---|---|---|
|token|`address`|The ERC20 token address|
|gas|`uint256`|The gas fee|
|weiPerToken|`uint256`|The Wei amount per token|