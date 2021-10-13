# Type of Nodes
Before introducing to different node types, there are serveral concepts which we should know:
* **Genesis block:** defined by a chain spec file, which describe the initial status of a chain, including the initial wasm, balances, authority set and so on.
* **Extrinsics:** a piece of information comes from outside the chain and included in a block, which will change the state of chain.
* **Events:** a piece of information comes from inside the chain, which may trigger some operation and change the state of chain.

The chain starts from a initial state, and updated by **Extrinsics** or **Events**. Assume the current block height is N, a validator will takes the chain state at block N and apply changes on top of it, to construct the block N+1.

## Archive node
**Archive Nodes** keeps all the historical state in storage. So it is convenient to use a archive node to query the state of a certain block height. For example, you can get the balance of `Alice` at block 20, or get the validator number at block 1024. As a result, running a archive node needs more disk space. Generally, archive nodes are used when you need to know the past states.

## Full node
**Full nodes** keeps states of genesis block and serveral recently blocks in storage. By default, blocks which is older than 256 from the latest finalized block will be discarded. Besides, full node keeps extrinsics for all past blocks, so it can rebuild the chain without additional information. Full nodes need less disk space than archive node and is used when you just want to read the recently state of chain, submit or validate extrinsics.

## Light node
**Light nodes** has only the runtime and current state, does not keep any of the historical state or extrinsics. Light nodes are useful for resource limited devices.

## Validator
**Validator** is a special kind of archive node. Like archive nodes, validators keep all the historical state in storage. More importantly, validators are participants of the chain, which are responsible for validate blocks, voting for finality and so on. Validators will be rewarded for maintaining the chain and slashed for misbehavior.