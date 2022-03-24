# Mystery Boxes Vault

Mystery box style vaults are more restricted than FIFO vaults, in a way that the token ID is randomly chosen and not revealed until the transaction has been broadcasted.

```solidity
function claim(
  uint256 _category,
  uint256 _deadline,
  bytes calldata _sig
)
```

| Parameter | Type | Description |
| --- | --- | --- |
| Category | `uint256` | The integer representation of a category |
| Deadline | `uint256` | Transaction reverts at `block.timestamp > deadline` |
| Sig | `bytes` | The user's EIP712 message to authorize the Treasury for collecting the payment. You may pass `0x` if `paymentToken == address(0)` |