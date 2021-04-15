# Front-running as a Service (FaaS) or MEV Auctions (MEVA)

In a FaaS or MEVA system, MEV is extracted in a variety of ways such as miners auctioning off the right to front-run users.

> "Centralizing MEV extraction is good because it quarantines a revenue stream that could otherwise drive centralization in other sectors."
> - [Vitalik on MEVA :octicons-link-external-16:][vitalik-meva]{target=_blank}

## :robot: Optimism

Optimism are the original proposers of MEVA.

MEV Auction (MEVA) is created in which the winner of the auction has the right to reorder submitted transactions and insert their own, as long as they do not delay any specific transaction by more than N blocks.

![](/assets/mev_auction.png){: style="zoom:100%"}

### Implementing the Auction

The auction is able to extract MEV from miners by separating two functions 1) Transaction inclusion; and 2) transaction ordering. In order to implement MEVA roles are defined. **Block producers** determine transaction inclusion, and **Sequencers** determine transaction ordering.

### Block producers - Transaction Inclusion

Block proposers are most analogous to traditional blockchain miners. Instead of proposing blocks with an ordering, they simply propose a set of transactions to eventually be included before N blocks.

### Sequencers - Transaction Ordering

Sequencers are elected by a smart contract managed auction run by the block producers called the MEVA contract. This auction assigns the right to sequence the last N transactions. If, within a timeout the sequencer has not submitted an ordering which is included by block proposers, a new sequencer is elected.

### Implementation on Layer 2

It is possible to enshrine this MEVA contract directly on layer 1 (L1) blockchain consensus protocols. However, it is also possible to non-invasively add this mechanism in layer 2 (L2) and use it to manage Optimistic Rollup transactio ordering. In L2, L1 miners are repurposed and utilized as block proposers. MEVA contract is implemented and designated a single sequencer at a time.

### References

[https://optimism.io/](https://optimism.io/){target=_blank}

[https://ethresear.ch/t/mev-auction-auctioning-transaction-ordering-rights-as-a-solution-to-miner-extractable-value/6788](https://ethresear.ch/t/mev-auction-auctioning-transaction-ordering-rights-as-a-solution-to-miner-extractable-value/6788){target=_blank}

[https://docs.google.com/presentation/d/1RaF1byflrLF3yUjd-5vXDZB1ZIRofVeK3JYVD6NPr30/edit#slide=id.gc9bdacc472_0_96](https://docs.google.com/presentation/d/1RaF1byflrLF3yUjd-5vXDZB1ZIRofVeK3JYVD6NPr30/edit#slide=id.gc9bdacc472_0_96){target=_blank}

## :robot: Flashbots

Flashbots is a research and development organization formed to mitigate the negative externalities and existential risks posed by MEV. They aim to Democratize MEV Extraction through MEV-Geth, which enables a sealed-bid block space auction mechanism for communicating transaction order preference.

ELI5 here [https://twitter.com/_silto_/status/1381292907567722498?s=20](https://twitter.com/_silto_/status/1381292907567722498?s=20)

Flashbots created an ETH node for miners, that not only watches the mempool like any other node, but also connects to a relayer (a server) operated by Flashbots. This MEV-Relay is a kind of parallel channel that directly connects miners to bots that want their transactions included.

The transactions that the bots want to include are sent through the MEV-Relay as bundles containing:

- the transactions to execute
- a tip to the miner, coming as an ETH transfer

These transactions use a 0 gwei gas price, as the payment to the miner is included in the transaction itself as the tip.

Since these transactions are sent through a parallel private relay, it reduces the mempool bidding war, failed transactions bloating the blockchain, and overall gas cost for users.

**<u>Links</u>**

GitHub [https://github.com/flashbots](https://github.com/flashbots){target=_blank}

Research [https://github.com/flashbots/mev-research](https://github.com/flashbots/mev-research){target=_blank}

Monthly Meetings [https://github.com/flashbots/pm](https://github.com/flashbots/pm){target=_blank}

API [https://blocks.flashbots.net/](https://blocks.flashbots.net/){target=_blank}

Discord [https://discord.gg/7hvTycdNcK](https://discord.gg/7hvTycdNcK){target=_blank}

Medium [https://medium.com/flashbots](https://medium.com/flashbots){target=_blank}

[https://medium.com/flashbots/frontrunning-the-mev-crisis-40629a613752](https://medium.com/flashbots/frontrunning-the-mev-crisis-40629a613752){target=_blank}

[https://medium.com/flashbots/quantifying-mev-introducing-mev-explore-v0-5ccbee0f6d02](https://medium.com/flashbots/quantifying-mev-introducing-mev-explore-v0-5ccbee0f6d02){target=_blank}

[https://ethresear.ch/t/flashbots-frontrunning-the-mev-crisis/8251](https://ethresear.ch/t/flashbots-frontrunning-the-mev-crisis/8251){target=_blank}

## :robot: Private Mempools

Today, some miners are already auctioning off mempool access for higher rates. Typically, transactions are broadcast to the mempool where they remain pending until miners pick them and add to the block. Private transactions however, are only visible to the pool and are not broadcast to other nodes (pay more for faster transactions).

Examples include [1inch Exchange's Stealth Transactions](https://help.1inch.io/en/articles/4695716-what-are-stealth-transactions-and-how-they-work){target=_blank} and [Taichi Network](https://taichi.network/){target=_blank}.

![](/assets/private_mempools.png){target=_blank}

Private Transactions offered by Taichi Network

Note: For the other side of the coin, read BloXroute Labs' take on why private mempools are not necessarily bad

[https://twitter.com/bloXrouteLabs/status/1357026919905173509?s=20](https://twitter.com/bloXrouteLabs/status/1357026919905173509?s=20){target=_blank}

Add something here

## :robot: KeeperDAO

KeeperDAO is similar to a mining pool for Keepers. By incentivizing a game theory optimal strategy for cooperation among on-chain arbitrageurs, KeeperDAO provides an efficient mechanism for large scale arbitrage and liquidation trades on all DeFi protocols.

The Hiding Game 

One of the 3 games that has been built. The Hiding Game refers to the cooperation between users and keepers to “hide” MEV by wrapping trades/debt in specialised on-chain contracts. These contracts restrict profit extracting opportunities to KeeperDAO itself.

Here's the ELI5

Users route their trades and loans through KeeperDAO, which attempts to extract any arbitrage or liquidation profit available. Those profits are returned back to the user in $ROOK tokens, and profits go into a pool controlled by $ROOK holders. By giving KeeperDAO priority access to arbitrage and liquidations, the Hiding Game maximizes the profits available from these opportunities.

**Links**

[https://keeperdao.com/#/](https://keeperdao.com/#/){target=_blank}

Wiki [https://github.com/keeperdao/docs/wiki](https://github.com/keeperdao/docs/wiki){target=_blank}

## :robot: ArcherDAO

ArcherDAO seeks to help miners capture more MEV. Miners outsource their search for MEV to ArcherDAO and those who provide MEV will receive a cut.

**Links**

[https://medium.com/archer-dao/introducing-archer-66f20d2cc425](https://medium.com/archer-dao/introducing-archer-66f20d2cc425){target=_blank}



[vitalik-meva]: https://medium.com/@VitalikButerin/i-feel-like-this-post-is-addressing-an-argument-that-isnt-the-actual-argument-that-mev-auction-b3c5e8fc1021
