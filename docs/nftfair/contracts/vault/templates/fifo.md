# FIFO Vault

First-in-first-out vaults correctly enforce the order of incoming claim transactions.

```solidity
function claim(
  uint256 _category,
  uint256 _id,
  uint256 _deadline,
  bytes calldata _sig
)
```

| Parameter | Type | Description |
| --- | --- | --- |
| Category | `uint256` | The integer representation of a category |
| ID | `uint256` | NFT Token ID to claim |
| Deadline | `uint256` | Transaction reverts at `block.timestamp > deadline` |
| Sig | `bytes` | The user's EIP712 message to authorize the Treasury for collecting the payment. You may pass `0x` if `paymentToken == address(0)` |