## XATA Overview

### Summary

XATA is a DEX powered using ConveyorV2. In other words, tokens that are traded in the ConveyorV2 liquidity pools enjoy the MEV protection and transaction ordering enforcement capabilities.  

To use XATA, users must sign an EIP712 message to authorize Geode to submit a transaction on the user's behalf. Users would still enjoy the benefit of gasless trading, meaning they are not required to hold native tokens like MATIC or BNB to pay for gas. 
However, users are subjected to pay a service fee with an acceptable form of ERC20 tokens, such as DAI, USDC or ATA tokens.

## Codebase

The XATA smart contracts are a fork of UniswapV2. To learn more about the DEX protocol, read the UniswapV2 [docs](https://docs.uniswap.org/protocol/V2/introduction).

There are certain modifications applied to the contracts. Check out the next section for details.

---

## Comparison between the UniswapV2 Protocol and XATA

This section highlights the modification that has been applied to the DEX protocol contracts.

### ConveyorV2Pair

  - The addition of the `onlyRouter()` modifier. This modifier guards the `mint()`, `burn()` and `swap()` methods, such that it is made callable by the Router contract only. This modifier is the most viable for enforcing MEV protection, because it prevents any other addresses from bypassing our relayers to perform sandwich attacks.

### ConveyorV2Factory

  - The `router()` address variable, the `ConveyorV2Pair` contract uses this value to match with the caller address. If the caller address does not match with `router()`, then the pair contract rejects the transaction. Using this approach also allows the "upgradeability" of the router. After the deployment of a newer version of the Router contract, the owner of the DEX can invoke the `setRouter()` method to map it to the new router address. At this point, all existing pair contracts would only accept function calls from the new Router contract.

### ConveyorV2Router01

  - The ConveyorV2 router introduces the ability for gasless trading. The user signs the EIP712 message, which is then submitted to the trusted relayer. The trusted relayer then executes the `executeMetaTx()` method, and pays gas on the user's behalf. After completion of execution, the Forwarder contract collects a service fee from the user to compensate for gas. Check out the `ERC20Forwarder` section to learn more about the Forwarder contract.

  - In an unlikely event when the relayer service is not available, the protocol owner can disable the meta-transaction functionality by invoking the `metaSwitch()` method to toggle the `metaOnly` modifier. This would allow users to directly interact with the router contract as a temporary workaround for such an extenuating circumstance.

---

## ERC20 Forwarder

The gas forwarder contract enables meta-transaction executions, which allows gas relayers to be compensated for the gas payment with ERC20 tokens. The gas forwarder contract has the ability to calculate a better estimation of the actual gas usage, including transactions that are being reverted. This way, the relayers are only compensated for the equivalent amount of ERC20 token in gas usage.

![erc20-forwarder.png](/assets/xata/forwarder_flow.png)

### **`constructor()`**

Initializes the contract and assigns `msg.sender` as the default `feeHolder`. The `feeHolder` is the recipient of the ERC20 fee payment.

### **`setConstantFee()`**

```solidity
function setConstantFee(uint256 _newConstantFee) public onlyOwner
```

Updates the `constantFee` value, defaults at 21000. Requires `owner()` privilege.

|Parameter|Type| |
|---|---|---|
| _newConstantFee | `uint256` | constant gas limit value |

### **`setTransferFee()`**

```solidity
function setTransferFee(uint256 _newTransferFee) public onlyOwner
```

Updates the ERC20 transfer gas limit, the `transferFee` value, defaults at 65000. Requires `owner()` privilege.

|Parameter|Type| |
|---|---|---|
| _newTransfeFee | `uint256` | ERC20 transfer limit value |

## **`setRelayer()`**

```solidity
function setRelayer(address _relayer, bool _trusted) public onlyOwner
```

Assigns or revokes relayer role. Requires `owner()` privilege.

|Parameter|Type| |
|---|---|---|
| _relayer | `address` | Relayer address |
| _trusted | `bool` | True: grant authorization; false: revoke authorization |

### **`setFeeHolder()`**

```solidity
function setFeeHolder(address _feeHolder) public onlyOwner
```

Transfers `feeHolder` role over to the input address. Requires `owner()` privilege.

|Parameter|Type| |
|---|---|---|
| _feeHolder | `address` | Fee holder address |

### **`MetaTransaction`**

```solidity
struct MetaTransaction {
    address from;
    address feeToken;
    uint256 maxTokenAmount;
    uint256 deadline;
    uint256 nonce;
    bytes data;
    bytes32 hashedPayload;
}
```

|Parameter|Type| |
|---|---|---|
| from | `address` | the user's address |
| feeToken | `address` | The address of the ERC20 fee token |
| maxAmountToken | `uint256` | The maximum amount of fee tokens that the users are willing to pay for the meta-tx |
| deadline | `uint256` | Meta-transactions that are executed past the deadline will be reverted |
| nonce | `uint256` | Replay protection |
| data | `bytes` | The encoded function data that is to be executed |
| hashedPayload | `bytes32` | EIP712-compliant hash struct |

### **`executeMetaTx()`**

```solidity
function executeMetaTx(MetaTransaction memory metatx, string memory domainName, uint256 tokenPricePerNativeToken, uint256 feeOffset, SIGNATURE_TYPE memory sig) public relayerOnly
```

This function executes the encoded function data, as defined in `MetaTransaction.data`. It calculates the amount of gas consumption within the enveloped function call and charges the user the fee amount that is based on the token/ETH price `tokenPricePerNativeToken`. This value is given by the Geode, calculated by an aggregation of token prices fetched from multiple sources. There are certain situations that could cause the transaction to revert, which the relayers will not be compensated for gas fee. The point of reverts are:

- Insufficient fee token balance
- Insufficient `maxAmountToken`
- Invalid EIP 712 signature
- Out of gas error

|Parameter|Type| |
|---|---|---|
| metatx | `MetaTransaction` | The meta-transaction body |
| domainName | `string` | The EIP712 domain name |
| tokenPricePerNativeToken | `uint256` | ERC20 token price per ETH |
| feeOffset | `uint256` | An additional amount of token to be taken into consideration when verifying the user's balance |
| sig | `SIGNATURE_TYPR` | The user's EIP712 signature |

## **`MetaStatus`**

```solidity
event MetaStatus(address sender, bool success, string error)
```

The `executeMetaTx` logs the event to indicate the status of the meta-tx. Execution failure within the meta-tx will not cause the function to revert. To view the error logs of a meta transaction, the client can simply listen for the `error` message emitted by this event.

|Parameter|Type| |
|---|---|---|
| sender | `address` | user address |
| success | `bool` | status of the meta-tx |
| error | `string` | reason of a reverted meta-tx |
