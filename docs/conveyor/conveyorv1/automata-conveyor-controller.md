# Controller

The prevention of anti-front-running is implemented by requiring that all method calls to the DEX must be only invoked by the Geode. The user submits a request to the Geode by signing the message without spending gas. The Geode later delegates that request to the DEX for a fee that is deducted from the output token.

---

## **`constructor()`**

```solidity
constructor(address _relayer,address _router,address _factory);
```

Initializes the Controller, Uniswap Factory, and Router contracts and assigns a relayer.

## **`relayers`**

```solidity
mapping (address => bool) public relayers;
```

Key-value pair map that keeps track of the trusted relayers.

|Parameter|Type| |
|---|---|---|
|key|`address`|Input address|
|value|`bool`|`True`: address is a trusted relayer. `False` : otherwise|

## **`uniswapV2TrustedPair`**

```solidity
mapping (address => bool) public uniswapV2TrustedPair;
```

Key-value pair map that keeps track of the trusted Uniswap token [pair addresses](https://uniswap.org/docs/v2/smart-contract-integration/getting-pair-addresses/).

|Parameter|Type| |
|---|---|---|
|key|`address`|Input address|
|value|`bool`|`True`: address is a trusted pair. `False` : otherwise|

## **`relayerOnly()`**

```solidity
modifier relayerOnly();
```

Verifies `msg.sender` is a trusted relayer address, otherwise reverts the function call.

## **`setRelayer()`**

```solidity
function setRelayer(address _relayer) public onlyOwner()
```

Assigns the input address as a trusted relayer, can only be invoked by the contract owner.

|Parameter|Type| |
|---|---|---|
|_relayer|`address`|Input address|

## **`isTrustedUniswapV2Pair()`**

```solidity
function isTrustedUniswapV2Pair(address pair) external override returns (bool);
```

Checks the input address to determine whether it is a trusted Uniswap pair address or not, returns `bool`.

|Parameter|Type| |
|---|---|---|
|pair|`address`|Input address|

## **`addTrustedUniswapV2Pair()`**

```solidity
function addTrustedUniswapV2Pair(address pair) public onlyOwner();
```

Adds the input address as a trusted Uniswap pair address, can only be invoked by the contract owner.

|Parameter|Type| |
|---|---|---|
|pair|`address`|Input address|

## **`removeTrustedUniswapV2Pair()`**

```solidity
function removeTrustedUniswapV2Pair(address pair) public onlyOwner();
```

Removes the pair address from the `uniswapV2TrustedPair` map, can only be invoked by the contract owner.

|Parameter|Type| |
|---|---|---|
|pair|`address`|Input address|

## **`gTokenTransferFrom()`**

```solidity
function gTokenTransferFrom(
    address asset,
    address from,
    address to,
    uint256 amount
) public relayerOnly();
```

Transfers ERC20 tokens from a sender address to a recipient address, can only be invoked by a relayer.

|Parameter|Type| |
|---|---|---|
|asset|`address`|The address of the ERC20 token|
|from|`address`|Sender address|
|to|`address`|Recipient address|
|amount|`uint256`|Amount of tokens to be transferred|

## **`uniswapV2AddLiquidity()`**

```solidity
function uniswapV2AddLiquidity(
    address from,
    address tokenA,
    address tokenB,
    uint256 amountADesired,
    uint256 amountBDesired,
    uint256 amountAMin,
    uint256 amountBMin,
    address to,
    uint256 deadline,
    bool gasIsTokenA
) public relayerOnly();
```

This method initially checks for either token A or B balance (depending on `gasIsTokenA`), to make sure that the user could pay for gas. Then, deducts the token amount, which is transferred to the relayer.

Supplies the token pair to the Uniswap liquidity pool, can only be invoked by a relayer and input tokens must be both wrapped tokens. Any leftover tokens that are not added to the liquidity pool will be refunded to the sender.

|Parameter|Type| |
|---|---|---|
|from|`address`|The sender address|
|tokenA|`address`|Wrapped Token A address|
|tokenB|`address`|Wrapped Token B address|
|amountADesired|`uint256`|The amount of A added to the liquidity pool if the B/A price <= (`amountofBDesired` / `amountofADesired`) price|
|amountBDesired|`uint256`|The amount of B added to the liquidity pool if the A/B price <= (`amountofADesired` / `amountofBDesired`) price|
|amountAMin|`uint256`|Bounds the extent to which the B/A price can go up before the transaction reverts. Must be <= `amountADesired`|
|amountBMin|`uint256`|Bounds the extent to which the A/B price can go up before the transaction reverts. Must be <= `amountBDesired`|
|to|`address`|The recipient address of the liquidity token. In this project, it is most likely the sender's address, since they provided liquidity, they should be entitled to getting rewarded with liquidity tokens|
|deadline|`uint256`|Unix timestamp after which the transaction is reverted|
|gasIsTokenA|`bool`|User to pay gas in Token A or Token B|

## **`uniswapV2SwapExactTokensForTokens()`**

```solidity
function uniswapV2SwapExactTokensForTokens(
    address from,
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
) public relayerOnly();
```

This method initially checks for the balance of the input token, to make sure that the user could pay for gas. Then after the swapping of tokens, deducts the **output** token amount, which is transferred to the relayer.

Swaps an exact amount of input tokens for as much of output tokens as possible, can only be invoked by a relayer. Any leftover tokens that are not swapped will be refunded to the sender.

|Parameter|Type| |
|---|---|---|
|from|`address`|The sender address|
|amountIn|`uint256`|The amount of input tokens to be sent|
|amountOutMin|`uint256`|The minimum amount of tokens that must be received, otherwise the transaction reverts|
|path|`address[]`|An array of token addresses. `path.length >= 2`|
|to|`address`|Recipient of the output tokens. In this project, it is also the sender's address|
|deadline|`uint256`|Unix timestamp after which the transaction is reverted|

## **`uniswapV2SwapTokensForExactTokens()`**

```solidity
function uniswapV2SwapTokensForExactTokens(
    address from,
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
) public relayerOnly();
```

This method initially checks for the balance of the input token, to make sure that the user could pay for gas. Then after the swapping of tokens, deducts the **output** token amount, which is transferred to the relayer.

Swaps an amount of input tokens for exact amount of output tokens, can only be invoked by a relayer. Any leftover tokens that are not swapped will be refunded to the sender.

|Parameter|Type| |
|---|---|---|
|from|`address`|The sender address|
|amountInMax|`uint256`|The minimum amount of tokens that must be sent, otherwise the transaction reverts|
|amountOut|`uint256`|The amount of output tokens to be sents|
|path|`address[]`|An array of token addresses. `path.length >= 2`|
|to|`address`|Recipient of the output tokens. In this project, it is also the sender's address|
|deadline|`uint256`|Unix timestamp after which the transaction is reverted|