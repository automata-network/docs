# Specifications
## Staging

### Frontend
<https://anydao.netlify.app/>

Currently supports wallet conenction with [Metamask](https://metamask.io/) and [Polkadot Extension](https://polkadot.js.org/extension/)

### Faucet
<https://faucet.ata.network>

### Blockchain
#### Explorer
[FiniteState dashboard](https://dashboard.ata.network/?rpc=wss%3A%2F%2Ffs-api.ata.network#/explorer)
#### Endpoints
<https://fs-rpc.ata.network>
<wss://fs-api.ata.network>
#### Configurations
- Minimum voting period: 1 hour
- Maximum voting period: 30 days
- Maximum option count: 10
#### Supported Chains
|     Platform      | Protocol|
|:-----------------:|:-------:|
|  Ropsten Testnet  |   EVM   |
|FiniteState Testnet|Substrate|

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
