# NFTFairVaultBase

NFTFair Vaults are responsible for fairly distributing NFTs, a.k.a. Fairdrop, this is all made possible by [Conveyor](https://www.ata.network/conveyor). The Vault contract achieves this by inheriting the `ConveyorBase` contract.

The `NFTVaultBase` contract provides the essential features to receive and organize NFTs by assigning categories. A category must be created **prior** to receiving any NFTs. The vault may reject any incoming NFTs, if a category is not created for that particular NFT contract.

The structure of the Category is the following:
```solidity
struct CategoryInfo {
  address nft;
  EnumerableSet.UintSet ids;
  EnumerableSet.UintSet claimable_ids;
  uint256 purchaseLimit;
  uint256 price;
}
```

| Parameter | Description |
| --- | --- |
| NFT | The address of the NFT contract. This address **cannot** be modified after initialization|
| ids | A list of token IDs that the vault has received. IDs are appended when the `onERC721Received` hook is called |
| claimable ids | A list of token IDs that are available to claim. A subset of the `ids` list. |
| Purchase Limit | The maximum amount of NFTs that a user is eligible to claim from the category |
| Price | Amount to be paid in `paymentToken` to purchase an NFT |

## `createCategory()`

```solidity
function createCategory(
  address _nft,
  uint256 _max,
  uint256 _price
)
```

Initializes a category.

| Parameter | Type | Description |
| --- | --- | --- |
| NFT | `address` | The NFT contract address. **CANNOT BE CHANGED AFTER INITIALIZATION** |
| Max | `uint256` | The maximum amount of NFTs that a user is eligible to claim from the category |
| Price | `uint256` | Amount to be paid in `paymentToken` to purchase an NFT |

## `updateCategory`

```solidity
function updateCategory(
  uint256 _category,
  uint256 _maxPurchase,
  uint256 _price
)
```

Updates the properties of a specified category, **except for the NFT address**. A new category must be created separately for a different NFT contract.

| Parameter | Type | Description |
| --- | --- | --- |
| Category | `uint256` | The integer representation of a category |
| Max | `uint256` | The maximum amount of NFTs that a user is eligible to claim from the category |
| Price | `uint256` | Amount to be paid in `paymentToken` to purchase an NFT |

## `configurePayment`

```solidity
function configurePayment(address _newToken, uint256[] memory _prices)
```

This function allows changing the payment token and/or updates prices across all categories in a single function call. 

| Parameter | Type | Description |
| --- | --- | --- |
| Token | `address` | The ERC20 token address |
| Prices | `uint256[]` | The length of the array must either be 0 or the total number of categories. This transaction reverts otherwise. |

## `revenuePayout`

```solidity
function revenuePayout(address _beneficiary, address _token)
```

The Vault owner calls this function to withdraw revenue out of the vault.

| Parameter | Type | Description |
| --- | --- | --- |
| Beneficiary | `address` | The recipient address |
| Token | `address` | The ERC20 token address |

## `recover`

```solidity
function recover(uint256[] memory _categoryArr, address _recipient)
```
The owner can invoke this method to withdraw remaining NFTs from one or more specified categories. This function call effectively empties all categories that are being recovered. 

| Parameter | Type | Description |
| --- | --- | --- |
| Categories | `uint256[]` | One or more categories |
| Recipient | `address` | The recipient address |

## `claimed`

```solidity
function claimed(address _user, uint256 _category) public view override returns (uint256[] memory)
```

Returns a list of token IDs that has been claimed by the `_user` from a specified `_category`

## `getClaimableIds`

```solidity
function getClaimableIds(uint256 _category) public view override returns (uint256[] memory)
```

Returns a list of available token IDs from a specified `_category`.

## `getCategoryPrice`

```solidity
function getCategoryPrice(uint256 _category) external view override returns (uint256)
```
Returns the amount of `paymentToken` required to purchase a single NFT from the specified `_category`. Call the `paymentToken()` method to get the ERC20 address of the payment token.

## `getCategoryNft`

```solidity
function getCategoryNft(uint256 _category) external view override returns (address)
```
Returns the address of the NFT contract from the specified `_category`.

## `getCategoryNftIds`

```solidity
function getCategoryNftIds(uint256 _category) external view returns (uint256[] memory)
```
Returns the list of token IDs that has been added into this category. This list excludes token IDs that had been recovered by the owner.

## `claimableCount`

```solidity
function claimableCount(uint256 _category) external view returns (uint256)
```

Return the number of available token IDs from a specified `_category`.

---

This base contract can be extended to implement the `claim()` function. `claim()` functions are implemented differently by their templates.