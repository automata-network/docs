# SDK

## The XATA-API module
The source code for this module can be found [here on Github](https://github.com/xata-fi/xata-sdk/tree/main/src/xata-api) , inside the `./src/xata-api directory`.

Each function within this module bundles the process of EIP712 signing, fee token calculation, and submitting meta transaction into a single workflow. The supported functions are the following:

* `addLiquidity()`
* `swapExactTokensForTokens()`
* `swapTokensForExactTokens()`
* `removeLiquidity()`

Using this module, developers no longer required to manually construct a transaction request that looks like this:
```json
{
    "method": "POST",
    "headers": 
    {
        "Content-Type": "application/json"
    },
    "body": "{\"jsonrpc\":\"2.0\",\"method\":\"/v2/metaTx/swapTokensForExactTokens\",\"id\":1,\"params\":[\"137\",{\"types\":{\"EIP712Domain\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"version\",\"type\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\"}],\"Forwarder\":[{\"name\":\"from\",\"type\":\"address\"},{\"name\":\"feeToken\",\"type\":\"address\"},{\"name\":\"maxTokenAmount\",\"type\":\"uint256\"},{\"name\":\"deadline\",\"type\":\"uint256\"},{\"name\":\"nonce\",\"type\":\"uint256\"},{\"name\":\"data\",\"type\":\"bytes\"},{\"name\":\"hashedPayload\",\"type\":\"bytes32\"}]},\"domain\":{\"name\":\"ConveyorV2\",\"version\":\"1\",\"chainId\":\"0x89\",\"verifyingContract\":\"0xe4C5Cf259351d7877039CBaE0e7f92EB2Ab017EB\"},\"primaryType\":\"Forwarder\",\"message\":{\"from\":\"0x10D73FE8e15414E7F1468eeb7A5A61A1aeec00C8\",\"feeToken\":\"0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174\",\"maxTokenAmount\":\"0x01\",\"deadline\":\"0x6179545d\",\"nonce\":\"0x20\",\"data\":\"0xf208e6ab000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000f424000000000000000000000000000000000000000000000000000000000000f185900000000000000000000000000000000000000000000000000000000000000a000000000000000000000000010d73fe8e15414e7f1468eeb7a5a61a1aeec00c8000000000000000000000000000000000000000000000000000000006179545d00000000000000000000000000000000000000000000000000000000000000020000000000000000000000002791bca1f2de4661ed88a30c99a7a9449aa84174000000000000000000000000c2132d05d31c914a87c6611c10748aeb04b58e8f\",\"hashedPayload\":\"0x5d299a1b988679b037e32d430bf2fbf03d5eb93949968c076c745ff2ffc18fe3\"}},\"28\",\"0xd8d7fdacaec4de579ee45c079cea896b576e994539f7980ec2ffb0c268fc07e3\",\"0x30dec79f68543f5785931f729ced63aabf5bc26219a11031150bced204d78ece\"]}"
}
```
​

## Installation
To use XATA-API module, you must first install the XATA SDK package from [NPM](https://www.npmjs.com/package/@xatadev/sdk).

```sh
yarn add @xatadev/sdk
```

We recommend you use Yarn to run the installation. If you prefer to use NPM (as some of us do!), just run the installation using this command:

```sh
npm i @xatadev/sdk
```

!!! warn
    It's best not to mix up the use of package managers to avoid resolution inconsistencies. Talk to your team and ask which package manager they are using.
​
## Getting Started
To use the module, simply do the following 3 steps:

1. Declare an instance of the XATA module.
```javascript
import { Xata } from '@xatadev/sdk';
    ​
const xataApi = new Xata();
```

1. Initiate the instance
```javascript
const feeToken = '<0xAddress>'
await xataApi.init(web3Provider, feeToken)

// use this method to change the fee token
const otherFeeToken = '<0xOtherAddress>'
await xataApi.setFeeToken(otherFeeToken)
```


1. Interact with XATA

    You may now interact with the XATA router using Uniswap-like functions. These functions return API responses like the one below:
```json
// response example
{
    "jsonrpc": "2.0",
    "result": {
        "errorMessage": null,
        "success": true,
        "txnHash": "0x3a130c90692053f412a26f6d7914bb7637f0193c0a7054621d3e3c3a7d13c24a"
    },
    "id": 1
}
```
    
We'll take a closer look at these functions in the following section.
​
## Router Methods

### Add Liquidity
Adds liquidity to the pool. If liquidity for the supplied pair does not exist in the pool then this router will initiate liquidity creation automatically.

```javascript
await xataApi.addLiquidity(<params>)
```

| Parameter | Type | Description |
| ----------|------|------------ |
| tokenA | `string` | Token A address |
| tokenB | `string` | Token B address |
| amountADesired | <div style="width: 100pt"> `ethers.BigNumber` | The amount of A added to the liquidity pool if the B/A price <= (`amountBDesired`/`amountADesired`) |
| amountBDesired | `ethers.BigNumber` | The amount of B added to the liquidity pool if the A/B price <= (`amountADesired`/`amountBDesired`) |
| amountAMin | `ethers.BigNumber` | Bounds the extent to which the B/A price can go up before the transaction reverts. Must be <= `amountADesired` |
| amountBMin | `ethers.BigNumber` | Bounds the extent to which the A/B price can go up before the transaction reverts. Must be <= `amountBDesired` |
| user | `string` | The user's address. The liquidity provider and the recipient of LP tokens |
| deadline | `BigNumber` | Unix timestamp after which the transaction is reverted |
| gasLimit | `BigNumber` | Optional: Gas limit for calculating the token fee amount. This value may not be the actual gas limit used in the transaction |
| gasPrice | `BigNumber` | Optional: Gas price for calculating the token fee amount. This value may not be the actual gas price used in the transaction |

### Swap Exact Tokens For Tokens
Swap an exact amount of input tokens for as many output tokens as possible.

```javascript
await xataApi.swapExactTokensForTokens(<param>)
```

| Parameter | Type | Description |
| ----------|------|------------ |
| amountln  | <div style="width: 100pt"> `ethers.BigNumber`| The amount of input tokens to send |
| amountOutMin | `ethers.BigNumber` | The minimum amount of output tokens that must be received for the transaction not to revert.|
| path | `address[]` | An array of token addresses. `path.length >= 2` |
| user | `address` | The user's address |
| deadline | `unit256` | Unix timestamp after which the transaction is reverted |
| gasLimit | `BigNumber` | Optional: Gas limit for calculating the token fee amount. This value may not be the actual gas limit used in the transaction |
| gasPrice | `BigNumber` | Optional: Gas price for calculating the token fee amount. This value may not be the actual gas price used in the transaction |

### Swap Tokens For Exact Tokens
Receive an exact amount of output tokens for as few input tokens as possible.

```javascript
await xataApi.swapTokensForExactTokens(<params>)
```

| Parameter | Type | Description | 
| ----------|------|------------ |
| amountOut | <div style="width: 100pt"> `ethers.BigNumber` | The amount of output tokens to receive |
| amountInMax | `ethers.BigNumber` | The maximum amount of input tokens that must                                      be sent for the transaction not to revert. |
| path | `address[]` | An array of token addresses. `path.length >= 2` |
| user | `address` | The user's address |
| deadline | `uint256` | Unix timestamp after which the transaction is reverted |
| gasLimit | `BigNumber` | Optional: Gas limit for calculating the token fee                                amount. This value may not be the actual gas limit used                          in the transaction |
| gasPrice | `BigNumber` | Optional: Gas price for calculating the token fee                                amount. This value may not be the actual gas price used                          in the transaction |

### Remove Liquidity
Withdraws a pair of tokens by burning LP tokens. This method consists of a 2-steps flow; it requires the LP holders to first sign a permit message, allowing the router to burn LP tokens, then proceeds with the actual LP tokens removal.

First, sign the message by calling the permitLP function. (No gas required)

```javascript
await xataApi.permitLP(<params>)
```

| Parameter | Type | Description
|-----------|------|------------
| pairAddr | `string` | The LP token address
| owner | `string` | The owner of the LP tokens. A.k.a. the user's address
| spender | `string` | The recipient address for the allowance. (XATA Router address)
| value | <div style="width: 100pt"> `ethers.BigNumber` | The liquidity value to approve
| nonce | `ethers.BigNumber` | The nonce used for signing the message
| deadline | `uint256` | Unix timestamp after which the transaction is reverted

It will return a Signature object that is required for removing liquidity.

```json
{
    "v": number,
    "r": string,
    "s": string
}
```

Once you receive the signature object from the permitLP then you can invoke the removeLiquidity function to withdraw tokens.

```javascript
await xataApi.removeLiquidity(<params>)
```

|Parameter | Type | Description
|----------|------|------------|
| tokenA | `string` | Token A address
| tokenB | `string` | Token B address
| liquidity | <div style="width: 100pt"> `ethers.BigNumber` | The amount of liquidity to remove
| amountAMin | `ethers.BigNumber` | The amount of tokenA that must be received before the transaction reverts
|amountBMin | `ethers.BigNumber` | The amount of tokenB that must be received before the transaction reverts |
| user | `string` | The user's address. The liquidity provider and the recipient of LP tokens
| deadline | `BigNumber` | Unix timestamp after which the transaction is reverted
| sig | `SignatureLike` | A signature object received from `permitLP()`
| gasLimit | `BigNumber` | Optional: Gas limit for calculating the token fee amount. This value may not be the actual gas limit used in the transaction
| gasPrice | `BigNumber` | Optional: Gas price for calculating the token fee amount. This value may not be the actual gas price used in the transaction |

## Relay Config
When a transaction request is successfully sent to one of the API routers, the transaction is forwarded and processed by Geode – one of our technologies that can increase privacy and eliminate trading MEV. To do this, the XATA SDK stores the Geode relay configuration as part of the API module.

```javascript
...
[ChainId.MATIC]: 'https://conveyor-prod-matic.ata.network',
[ChainId.BSC]: 'https://conveyor-prod-bsc.ata.network',
...
```

Developers can freely customize these endpoints to meet their application needs. To customize it, set new endpoint value(s) for each chain that is supported by your app. [You can find the config here.](https://github.com/xata-fi/xata-sdk/blob/main/src/xata-api/lib/relayer.ts)

### Using a Test Relay on Development

XATA API works on production mode by default, and therefore the transaction request also gets forwarded to production-grade Geode. If you are under the development stage and want to test the transaction on a separate relay, you need to make a couple of changes.

Update the relay configuration as in the previous section. What makes it different from the previous one is that you have to set the endpoint value(s) under the `Environment.STAGING` object instead of `Environment.PRODUCTION`.

```javascript
[Environment.PRODUCTION]: {
    ...
    [ChainId.MATIC]: 'https://conveyor-prod-matic.ata.network',
    [ChainId.BSC]: 'https://conveyor-prod-bsc.ata.network',
    ...
},
[Environment.STAGING]: {
    ...
    [ChainId.MATIC]: 'https://your-test-relay.endpoint',
    [ChainId.BSC]: 'https://your-test-relay.endpoint',
    ...
}
```
    
Update the XATA initiation code on your app.

```javascript
// Add new Environment enum import
import { Environment, XATA } from '@xatadev/sdk'
    ​
const xataApi = new Xata();
const feeToken = '<0xAddress>'

// Add 3rd param to override the SDK env mode
await xataApi.init(web3Provider, feeToken, Environment.STAGING);
```