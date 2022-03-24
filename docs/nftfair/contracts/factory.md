# NFTFairFactory

The Factory contract stores template bytecodes. Upon deployment of the vaults, the owner can select a template by providing its corresponding ID. Once the vault has been deployed, they get full ownership of the Vault contract, implemented using OpenZeppelin's [`Ownable`](https://docs.openzeppelin.com/contracts/2.x/access-control#ownership-and-ownable) library.

The admin of the Factory contract has the ability to modify the bytecodes stored in the factory, as a means of upgrading existing templates or adding a new template to the platform. Any changes on the Factory contract will **NOT** impact any existing vaults. Owners who opted to use a newer version of the vault template, must re-deploy a vault.

This Factory contract is upgradeable using a [Transparent Proxy](https://blog.openzeppelin.com/the-transparent-proxy-pattern/).

## `initialize()`

```solidity
function initialize(address _owner)
```
Initializes the state of the contract. In this case, this method initializes the owner of the Factory contract. This method must be implemented for a proxied contract. For more information, see [`Initializable`](https://docs.openzeppelin.com/upgrades-plugins/1.x/writing-upgradeable#initializers) on OpenZeppelin.

:warning: **Note:** It is advisable to encode this method and pass as a `data` argument upon invoking the `upgradeTo()` method on the proxy contract for the first time. This is to avoid leaving the proxy uninitialized post-deployment.

## `addVaultTemplate()`

```solidity
function addVaultTemplate(bytes memory _bytecode)
```
Adds a new bytecode template to the Factory, and returns the ID of the template. Requires `onlyOwner()`

| Parameter | Type | Description |
| --- | --- | --- |
| Bytecode | `bytes` | The **creation bytecode** of the template |

## `updateVaultTemplate()`

```solidity
function updateVaultTemplate(uint256 _templateId, bytes memory _bytecode)
```

Updates an existing vault template. Requires `onlyOwner()`.

:warning:  **Note:** This does not affect existing vaults. Given the immutable nature of smart contracts, the template of the vault permanently adheres to the version of the bytecode based on the time of deployment.

| Parameter | Type | Description |
| --- | --- | --- |
| Template ID | `uint256` | The ID of a template. Reverts if an invalid ID is provided |
| Bytecode | `bytes` | The **creation bytecode** of the template |

## `createVault()`

```solidity
function createVault(uint256 _templateId, bytes calldata _constructorData)
```

Deploys a vault according to a template provided by its ID.

| Parameter | Type | Description |
| --- | --- | --- |
| Template ID | `uint256` | The ID of a template. Reverts if an invalid ID is provided |
| Constructor Data | `bytes` | ABI encoded constructor data |

## `getVaultTemplate()`

```solidity
function getVaultTemplate(uint256 _templateId) external view returns (bytes memory)
```

Gets the bytecode of a given template ID.

## `getVaultTemplateCount()`

```solidity
function getVaultTemplateCount() external view returns (uint256)
```

Returns the number of templates stored in the Factory.