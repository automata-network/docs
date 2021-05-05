# Introduction

Automata [Witness](https://witness.ata.network) is a customizable voting service for decentralized applications. It aims to provide a fully decentralized voting platform across different blockchain where users don't need to worry about their privacy being compromised.

## Features

* **Privacy**: You can choose different types of votes with different privacy levels e.g. Public (full disclosure of voter address and number of votes), Medium (only number of votes), and Private (only voting result is published — voter identities and number of votes are not).
* **Off-chain**: Voting is conducted off-chain so there is no gas cost and a wider range of token holders can participate in governance without being deterred by high gas fees.
* **Chainhook**: Trigger on-chain execution based on the voting results. Chainhook enables calling of the on-chain contract which was registered at proposal creation
* **Modularity**: Each of these functions can be used as standalones, or together. If a project wants to use Witness as a signaling tool without on-chain execution, that is also possible.

## Platforms

Witness aims to support many platforms and the following platforms are supported:

* Ethereum (Mainnet, Kovan Testnet)
* Binance Smart Chain (Mainnet, Testnet)

Next, we will add more [EVM-based chains][evm-chains] and [Substrate-based chains][substrate-chains] to the list.

### Feature Support

|          Platform           |   Private Voting   |     Chainhook      | Public Voting |
|:---------------------------:|:------------------:|:------------------:|:-------------:|
|      Ethereum Mainnet       | :white_check_mark: |   :construction:   |   :clock9:    |
|   Ethereum Kovan Testnet    | :white_check_mark: | :white_check_mark: |   :clock9:    |
| Binance Smart Chain Mainnet | :white_check_mark: |   :construction:   |   :clock9:    |
| Binance Smart Chain Mainnet | :white_check_mark: | :white_check_mark: |   :clock9:    |

[evm-chains]: https://chainlist.org/
[substrate-chains]: https://polkaproject.com/#/projects?cateID=1&tagID=0