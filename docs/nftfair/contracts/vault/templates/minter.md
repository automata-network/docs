# Minter Vault

This vault extends the `NFTFairVaultBase` contract. However, there are several notable characteristics that set itself apart from the currently existing templates. Such differences are:

- The contract no longer holds pre-minted tokens, and will not accept any inbound token transfers. Calling the `onERC721Received` hook will cause a transaction to revert.
- The `ids` property of the Category object stores a list of token IDs that has been minted by the Vault.
- The `claimable_ids` property of the category object stores a list of pre-configured IDs that will be minted from the specified category.

---

## Workflow

The workflow to host a Fairdrop using this template does not deviate too far from the current workflow, except that it no longer requires the step of transferring tokens to the vault.

The following briefly shows the steps of setting up a Fairdrop using this template:

1. Deploy a Minter vault.

2. Deploy a contract that inherits either the `IERC721Mintable` or `IERC1155Mintable` interface

3. Grant `MINTER_ROLE` permission to the Minter vault contract.

4. Create one or more categories as usual.

5. The vault is now ready to mint and distribute tokens.

---

## Methods

### Overloaded Methods

The following functions inherited from the `NFTFairVaultBase` have been overloaded to accommodate the use case for this template.

#### `getCategoryNftIds`

```solidity
function getCategoryNftIds(uint256 _category) public view override returns (uint256[] memory)
```

Returns the list of all NFT IDs belonging to the specified `_category`. This implementation is slightly different from `NFTFairVaultBase` because the `category.ids` list only contains the list of IDs that were minted by users. The function concatenates the `category.ids` and `category.claimable_ids` lists to make a list of all IDs.

#### `recover`

```solidity
function recover(uint256[] memory _categoryArr, address _recipient)
```

This function results in the transaction to immediately revert, since, it is no longer necessary for the vault to recover any tokens.

#### `onERC**Received`

Same as `recover`.

---
### Set Category ID

```solidity
function setCategoryIds(uint256 _category, uint256[] memory _ids, uint256[] memory _amounts) external
```

Use this method to assign token IDs to a category. This method must be invoked prior minting of tokens.

| Parameter | Type | Description |
| --- | --- | --- |
| Category | `uint256` | The integer representation of a category |
| IDs | `uint256[]` | An array of token IDs to be added into the category |
| Amounts | `uint256[]` | The amount of corresponding `_ids` to be added into the category. Pass an empty array for ERC721 tokens | 

### Claim

```solidity
function claim(uint256 _category, uint256 _deadline, bytes calldata _sig) external onlyConveyor
```

Mints and distributes a token to the user. The token ID is not revealed until the transaction is final.

| Parameter | Type | Description |
| --- | --- | --- |
| Category | `uint256` | The integer representation of a category |
| Deadline | `uint256` | Transaction reverts at `block.timestamp > deadline` |
| Sig | `bytes` | The user's EIP712 message to authorize the Treasury for collecting the payment. You may pass `0x` if `paymentToken == address(0)` |
