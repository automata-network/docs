# ConveyorForwarder

The Forwarder contract enables meta-transaction executions, this contract ensures the relayer account is compensated for gas that is charged upon the users to be paid in ERC20 tokens. The Forwarder contract is also responsible for EIP712 Signature verification to validate the origin sender address, before forwarding the transaction to the implementation contract.

![erc20-forwarder.png](/assets/conveyorv2/forwarder_flow.png)

## **`setConstantFee()`**

```solidity
function setConstantFee(uint256 _newConstantFee) public onlyOwner
```

Updates the `constantFee` value, defaults at 21000. Requires `owner()` privilege.

|Parameter|Type| |
|---|---|---|
| _newConstantFee | `uint256` | constant gas limit value |

## **`setTransferFee()`**

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

## **`MetaTransaction`**

```solidity
struct MetaTransaction {
    address from;
    address to;
    address feeToken;
    bool useOraclePriceFeed;
    uint256 maxTokenAmount;
    uint256 deadline;
    uint256 nonce;
    bytes data;
    uint256[] extendCategories;
}
```

|Parameter|Type| |
|---|---|---|
| from | `address` | the user's address |
| to | `address` | the recipient contract address |
| feeToken | `address` | The address of the ERC20 fee token |
| useOraclePriceFeed | `bool` | Users can opt for getting token price from an on chain oracle |
| maxAmountToken | `uint256` | The maximum amount of fee tokens that the users are willing to pay for the meta-tx |
| deadline | `uint256` | Meta-transactions that are executed past the deadline will be reverted |
| nonce | `uint256` | Replay protection |
| data | `bytes` | The encoded function data that is to be executed |
| extendCategories | `uint256[]` | An array of numeric categories mapping the request extension type |


## **`executeMetaTxV2()`**

```solidity
function executeMetaTxV2(
    ConveyorTypes.MetaTransaction memory metatx,
    string memory domainName,
    bool relayerChargeEnabled,
    uint256 tokenPricePerNativeToken,
    SignatureSignerType signerType,
    bytes memory sig,
    bytes memory extendParamData
)
```

This function executes the encoded function data, as defined in `MetaTransaction.data`. It calculates the amount of gas consumption within the enveloped function call and charges the user the fee amount that is based on the token/native (e.g. ERC20/ETH on Ethereum, ERC20/BNB on BSC etc.) price `tokenPricePerNativeToken`. This value is given by the Geode (or from an on chain oracle if applicable). There are certain situations that could cause the transaction to revert, which the relayers will not be compensated for gas fee. The point of reverts are:

- Insufficient fee token balance
- Insufficient `maxAmountToken`
- Invalid EIP 712 signature
- Out of gas error

|Parameter|Type| |
|---|---|---|
| metatx | `MetaTransaction` | The meta-transaction body |
| domainName | `string` | The EIP712 domain name |
| tokenPricePerNativeToken | `uint256` | ERC20 token price per native EVM token (e.g. ETH on Ethereum, Matic on Polygon PoS etc.) |
| SignatureType | `SignatureSignerType` | Signer Type, EOA or CONTRACT ([EIP 1271](https://eips.ethereum.org/EIPS/eip-1271) Compliant) |
| sig | `SIGNATURE_TYPR` | The user's EIP712 signature |
| extendParamData | `bytes` | The returned Extension data |

## **`MetaStatus`**

```solidity
event MetaStatus(address sender, bool success, string error)
```

The `executeMetaTxV2` logs the event to indicate the status of the meta-tx. Execution failure within the meta-tx will not cause the function to revert. To view the error logs of a meta transaction, the client can simply listen for the `error` message emitted by this event.

|Parameter|Type| |
|---|---|---|
| sender | `address` | user address |
| success | `bool` | status of the meta-tx |
| error | `string` | reason of a reverted meta-tx |
