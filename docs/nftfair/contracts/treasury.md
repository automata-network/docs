# NFTFairTreasury
The treasury contract serves as a central entity for collecting payment and sales revenue generated from vaults. This design is intended such that users would send at most one `approve()` call for **one** ERC20 token that can be spent across all vaults on the NFTFair platform.

To ensure the protocol does not drain the user's allowance without explicit approval, the `collectPayment()` method requires an EIP712 Signature, indicating the amount of specified tokens to be spent by an authorized address.

The structure of the EIP712 Message (similarly based on [EIP 2612](https://eips.ethereum.org/EIPS/eip-2612)) is the following:

```typescript
Permit: [
    { name: 'owner', type: 'address' },
    { name: 'spender', type: 'address' },
    { name: 'token', type: 'address' },
    { name: 'value', type: 'uint256' },
    { name: 'nonce', type: 'uint256' },
    { name: 'deadline', type: 'uint256' },
],
```

| Parameter | Description |
| --- | --- |
| owner | The owner of the token. This is most likely the user's address |
| spender | The authorized spender. This is most likely the vault's address |
| token | The address of the ERC20 token to be spent |
| value | The payment amount |
| nonce | The user's transaction count in the Treasury contract |
| deadline | Transaction reverts at `block.timestamp > deadline` |

In the future, the protocol may set a fee upon payment collection, using basis points. This value is given a ceiling of 3000. In other words. the protocol can not set a fee higher than 30%.

Last but not least, the protocol has the ability to exempt fees or configure a custom fee percentage for a specified spender. If an address is neither exempt nor assigned with a custom basis point, the Treasury will collect fee using the default BP.

## `collectPayment()`

```solidity
function collectPayment(
  address _buyer,
  address _token,
  uint256 _amount,
  uint256 _deadline,
  bytes calldata _signature
)
```

This function is called by the payee directly, to collect payment from the buyer.

| Parameter | Type | Description |
| --- | --- | --- |
| buyer | `address` | The owner of the token. This is most likely the user's address |
| token | `address` | The address of the ERC20 token to be spent |
| amount | `uint256` | The payment amount |
| deadline | `uint256` | Transaction reverts at `block.timestamp > deadline` |
| signature | `bytes` | The user signed EIP712 message |

## `setNewBp`

```solidity
function setNewBp(uint256 _newBp)
```
Sets a new default BP. Requires `onlyOwner()`

| Parameter | Type | Description |
| --- | --- | --- |
| New BP | `uint256` | REVERTS > 3000 |

## `setAddressBp`

```solidity
function setAddressBp(address _spender, uint256 _newBp)
```
Specifies a custom BP for `_spender`. Requires `onlyOwner()`

| Parameter | Type | Description |
| --- | --- | --- |
| Spender | `address` | This is most likely the vault's address.  |
| New BP | `uint256` | REVERTS > 3000 |

## `toggleAddressExemption`

```solidity
function toggleAddressExemption(address _spender)
```
Exempts/Unexempts `_spender` from paying fees. Requires `onlyOwner()`

| Parameter | Type | Description |
| --- | --- | --- |
| Spender | `address` | This is most likely the vault's address. |

## `recoverERC20()`

```solidity
function recoverERC20(
  address _recipient,
  address _token,
  uint256 _amount
)
```

Withdraws the protocol revenue. Requires `onlyOwner()`.

| Parameter | Type | Description |
| --- | --- | --- |
| recipient | `address` | The recipient address |
| token | `address` | The address of the ERC20 token |
| amount | `uint256` | The amount to withdraw |

## `getFeeMultiplier()`

```solidity
function getFeeMultiplier(address _spender) public view returns (uint256 multiplier)
```

Returns the BP value for a specified `_spender`.