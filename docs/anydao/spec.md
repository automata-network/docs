# Specifications
## Staging

### Frontend
<https://the.anydao.app/>

Currently supports wallet conenction with [Metamask](https://metamask.io/) and [Polkadot Extension](https://polkadot.js.org/extension/)

### Faucet
<https://faucet.ata.network>

### Blockchain
#### Explorer
[ContextFree Dashboard](https://dashboard.ata.network/?rpc=wss%3A%2F%2Fcf-api.ata.network#/explorer)
#### Endpoints
<https://cf-rpc.ata.network>
<wss://fs-api.ata.network>
#### Configurations
- Minimum voting period: 1 hour
- Maximum voting period: 30 days
- Maximum option count: 10
- Maximum workspace number: 10
- Maximum strategy number: 10
#### Supported Chains
|     Platform      | Protocol|
|:-----------------:|:-------:|
|  Automata Mainnet  |   Substrate   |
| ContextFree Canary Network | Substrate |
| FiniteState Testnet| Substrate |
| Ethereum Mainnet | EVM |
| Ropsten Testnet | EVM |
| Kovan Testnet | EVM |
| BSC Mainnet | EVM |
| BSC Testnet | EVM |
| Polygon Mainnet | EVM |
| Polygon Testnet | EVM |
| HECO Mainnet | EVM |
| HECO Testnet | EVM |
| Moonbase Alpha Testnet | EVM |
| Avalanche Testnet | EVM |
| Avalanche Mainnet | EVM |

#### Strategies
##### EVM
|     Name   |   Parameter    |          Description           |
|:----------:|:--------------:|:------------------------------:|
|ERC20Balance|Contract Address|Take `BalanceOf` as voting power|

##### Substrate
|    Name     |Parameter|  Description  |
|:-----------:|:-------:|:-------------:|
|NativeBalance|    -    |Take `System/Account` and the `Free` balance as voting power|

#### Voting Type
|    Name    | Parameter |Description|
|:----------:|:---------:|:---------:|
|SingleChoice|     -     |User can vote on only one option|
