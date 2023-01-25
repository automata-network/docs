# gToken

 The goal of gTokens is to achieve front-running resistance on DEXs such as Uniswap. When two different gTokens are swapped, users can rest assured that the swapping transaction will not be attacked by front-running bots or malicious miners. This is achieved by inheriting the ERC20 contract, with modified function methods. Methods such as `transferFrom()` requires that it has to be invoked only from a trusted relayer.

 ---

## **`constructor()`**

 ```solidity
    constructor(address _token, address _controller);
 ```

Initializes the contract, then wraps the ERC20 token and assigns the `Controller` contract instance.

| Parameter | Type    |                                                              | 
|-----------|---------|--------------------------------------------------------------|
|_token     |`address`| The ERC20 Token Address                                      |
|_controller | `address` | The address of the `Controller` instance |

## **`onlyController()`**

```solidity
modifier onlyController();
```

Verifies `msg.sender` is the Controller address. Otherwise, reverts function calls.

## **`setController()`**

```solidity
function setController(address _controller) public onlyOwner();
```

Sets the Controller instance, can only be invoked by the contract owner.

|Parameter|Type| |
|---|---|---|
|_controller|`address`|The address of the Controller instance|

## **`transferFrom()`**

```solidity
function transferFrom(
    address sender, 
    address recipient, 
    uint256 amount
) public override returns (bool);
```
Transfers gTokens from a given address to the recipient. The sender is always the address of the `Controller`, the transaction is not necessarily originated from the `Controller` contract itself, as long as the origin address is one of the trusted relayers. For the direct call method, see `internalTransferFrom()`.

|Parameter|Type| |
|---|---|---|
|sender|`address`|The address of a trusted relayer|
|recipient|`address`|The recipient's address, most likely a token pair address. For example, an address returned by Uniswap's `getPair(tokenA, tokenB)`.
|amount|`uint256`|The amount of token to be transferred.

This method reverts if it is not invoked from a trusted relayer. Otherwise, returns true.

## **`transfer()`**

```solidity
function transfer(address recipient, uint256 amount) public override returns (bool);
```

Transfers gTokens to a recipient. This method can only be invoked by a trusted token pair.

|Parameter|Type| |
|---|---|---|
|recipient|`address`|The recipient's address|
|amount|`uint256`|The amount of token to be transferred|

## **`internalTransferFrom()`**

```solidity
function internalTransferFrom(
    address sender,
    address recipient,
    uint256 amount
) public onlyController();
```

Transfers gTokens from a given address to the recipient, similar to `transferFrom()`. This method can only be invoked directly from the `Controller` contract.

|Parameter|Type| |
|---|---|---|
|sender|`address`|The sender's address|
|recipient|`address`|The recipient's address|
|amount|`uint256`|The amount of token to be transferred|

## **`deposit()`**

```solidity
function deposit(uint256 amount) public;
```

Wraps ERC20 token to a gToken. The gToken smart contract stores an amount of ERC20 token as a reserve and mints the same amount of wrapped ERC20 token.

|Parameter|Type| |
|---|---|---|
|amount|`uint256`|The amount of token to be transferred|

## **`withdraw()`**

```solidity
function withdraw(uint256 amount) public;
```

Withdraws ERC20 token from the smart contract and burns the wrapped token.

|Parameter|Type| |
|---|---|---|
|amount|`uint256`|The amount of token to be transferred|