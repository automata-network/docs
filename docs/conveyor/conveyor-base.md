# ConveyorBase

The ConveyorBase Contract includes administrative controls on the implementation targets, where owners can do the following:

- Enables/Disables Conveyor protection
- Sets a trusted forwarder address

With the additional support of Conveyor Extensions, the Geode Oracle returned data can be extracted by using the `_extractData()` method. The implementation contract is responsible for decoding the data into its desired type using the `abi.decode()` method.

## `constructor()`

This contract is to be initialized by providing the Forwarder address.

```solidity
constructor(address _forwarder)
```

|Param|Type|Description|
|---|---|---|
|`_forwarder` | address | The address of the trusted forwarder contract |

## `setForwarder()`

Changes the trusted Forwarder address. **Requires: Ownership privilege**

```solidity
function setForwarder(address _forwarder) external onlyOwner
```

|Param|Type|Description|
|---|---|---|
|`_forwarder` | address | The address of the trusted forwarder contract |

## `isTrustedForwarder`

Checks if the provided address is a trusted Forwarder

```solidity
function isTrustedForwarder(address _forwarder) public
```

|Param|Type|Description|
|---|---|---|
|`_forwarder` | address | Address to be verified |

## `onlyConveyor`

A modifier that restricts a method, such that its caller can only originate from the `Forwarder` address

## `enableConveyorProtection`

Enables the `conveyorIsEnabled` state. This effectively turns any methods with the `onlyConveyor` modifier to benefit from MEV protection. 

## `disableConveyorProtection`

Disables the `conveyorIsEnabled` state. Allowing users to directly executing methods even with the `onlyConveyor` modifier.

## `_msgSender()`

You **MUST** use this method to get the sender's address. Avoid using the default `msg.sender` value.

## `_extractData()`

This low-level method extracts the Conveyor Extension data from `msg.data`. Check out the [Appendix](./appendix.md) section for technical details.
