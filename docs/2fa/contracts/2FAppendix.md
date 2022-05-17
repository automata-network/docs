# Appendix

## Signature Extraction

Data that are sent to `TwoFactorBase` contracts must **strictly** adhere to the following format.

|  Calldata | Deadline | Signature |
| --- | --- | --- |
| *dynamically-sized* | 32 bytes | 65 bytes |

Transaction data that are in compliance with the above format is then divided into three parts using the formula described below:

- Deadline = Data [len-97 : len-65]

This is the given deadline of a transaction, which reverts at `block.timestamp > deadline`.

- Signature = Data [-65]

The relayer signature can be simply extracting by slicing out the last 65-bytes of `msg.data`.

- Calldata = Data [0 : len-97]

The actual calldata is the entire `msg.data` excluding the last 97-byte.

---

## 2FA Message

The message is a hash of the encoded structure, as defined by the following:

```solidity
bytes32 hash = keccak256(
    abi.encode(
        uint256 chainId,
        uint256 walletNonce,
        bytes32 domain_name_hash,
        uint256 deadline,
        address primary,
        address target,
        bytes data
    )
)
```

An **honest** relayer may only sign this message **if and only if** the relayer is able to verify that the provided 2FA code from the primary wallet holder is valid.