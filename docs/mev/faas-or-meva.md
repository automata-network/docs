# Front-running as a Service(FaaS) or MEV Auctions (MEVA)

In a FaaS or MEVA system, instead of miners developing front-running expertise themselves, MEV is extracted in a variety of ways such as miners auctioning off the right to front-run users.

Vitalik on MEVA

> Centralizing MEV extraction is good because it quarantines a revenue stream that could otherwise drive centralization in other sectors.

[https://medium.com/@VitalikButerin/i-feel-like-this-post-is-addressing-an-argument-that-isnt-the-actual-argument-that-mev-auction-b3c5e8fc1021](https://medium.com/@VitalikButerin/i-feel-like-this-post-is-addressing-an-argument-that-isnt-the-actual-argument-that-mev-auction-b3c5e8fc1021){target=_blank}

## Optimism

Original proposers of MEVA and ETH 1.5.

MEV Auction (MEVA) is created, in which the winner of the auction has the right to reorder submitted transactions and insert their own, as long as they do not delay any specific transaction by more than N blocks.

![](/assets/mev_auction.png){: style="zoom:100%"}

**Implementing the Auction**

The auction is able to extract MEV from miners by separating two functions 1) Transaction inclusion; and 2) transaction ordering. In order to implement MEVA roles are defined. **Block producers** which determine transaction inclusion, and **Sequencers** which determine transaction ordering.

**Block producers - Transaction Inclusion**

Block proposers are most analogous to traditional blockchain miners. Instead of proposing blocks with an ordering, they simply propose a set of transactions to eventually be included before N blocks.

**Sequencers - Transaction Ordering**

Sequencers are elected by a smart contract managed auction run by the block producers called the MEVA contract. This auction assigns the right to sequence the last N transactions. If, within a timeout the sequencer has not submitted an ordering which is included by block proposers, a new sequencer is elected.

**Implementation on Layer 2**

It is possible to enshrine this MEVA contract directly on layer 1 (L1) blockchain consensus protocols. However, it is also possible to non-invasively add this mechanism in layer 2 (L2) and use it to manage Optimistic Rollup transaction ordering. In L2, L1 miners are repurposed and utilized as block proposers. MEVA contract is implemented and designated a single sequencer at a time

**<u>Links</u>**

[https://optimism.io/](https://optimism.io/){target=_blank}

[https://ethresear.ch/t/mev-auction-auctioning-transaction-ordering-rights-as-a-solution-to-miner-extractable-value/6788](https://ethresear.ch/t/mev-auction-auctioning-transaction-ordering-rights-as-a-solution-to-miner-extractable-value/6788){target=_blank}

[https://docs.google.com/presentation/d/1RaF1byflrLF3yUjd-5vXDZB1ZIRofVeK3JYVD6NPr30/edit#slide=id.gc9bdacc472_0_96](https://docs.google.com/presentation/d/1RaF1byflrLF3yUjd-5vXDZB1ZIRofVeK3JYVD6NPr30/edit#slide=id.gc9bdacc472_0_96){target=_blank}

## Flashbots

Flashbots is a research and development organization formed to mitigate the negative externalities and existential risks posed by MEV. They aim to Democratize MEV Extraction through MEV-Geth, which enables a sealed-bid block space auction mechanism for communicating transaction order preference.

The ELI5 here [https://twitter.com/_silto_/status/1381292907567722498?s=20](https://twitter.com/_silto_/status/1381292907567722498?s=20){target=_blank}

Flashbots aims to reduce gas cost and some other issues that come from the activity of arbitrage bots on chain. One of the things that raises gas cost is that bots compete between each other to have the same transaction included first on the blockchain. If multiple bots detect an arbitrage between pools, they will craft the same transaction, send it to the mempool, but then detect that other bots are on it too and start raising the gas price on their transaction to be included first, like in an auction. The only limit to the price they are willing to pay for their transaction is the profitability of the arbitrage. So a bot detecting a 10K$ profit on an arbitrage could raise its gas price to something like 50 000Gwei, as long as the transaction costs less than 10K$. Miners profiting from this is called MEV because the miners get a fat fee from this gas bidding war. But the problem for normal users is that it leads to overpriced transactions being included preferentially and higher gas cost overall.

Flashbots created an ETH node for miners, that not only watches the mempool like any other node, but also connects to a relayer (a server) operated by Flashbots. This MEV-Relay is a kind of parallel channel that directly connects miners to bots that want their transactions included.

The transactions that the bots want to include are sent through the MEV-Relay as bundles containing:

- the transactions to execute
- a tip to the miner, coming as an ETH transfer And the transactions use a 0gwei gas price, as the payment to the miner is included in the transaction itself as the tip.

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

## Private Mempools

Today, some miners are already auctioning off mempool access for higher rates. Typically, transactions are broadcast to the mempool where they remain pending until miners pick them and add to the block. Private transactions however, are only visible to the pool and are not broadcast to other nodes.

Examples include [1inch Exchange's Stealth Transactions](https://help.1inch.io/en/articles/4695716-what-are-stealth-transactions-and-how-they-work){target=_blank} and [Taichi Network](https://taichi.network/){target=_blank}.

![](/assets/private_mempools.png){target=_blank}

Private Transactions offered by Taichi Network

Note: Read here on how bloXroute Labs argues for the other side of the coin

[https://twitter.com/bloXrouteLabs/status/1357026919905173509?s=20](https://twitter.com/bloXrouteLabs/status/1357026919905173509?s=20){target=_blank}

And their proposed solutions [https://twitter.com/bloXrouteLabs/status/1359027468393406464?s=20](https://twitter.com/bloXrouteLabs/status/1359027468393406464?s=20){target=_blank}

1- use bare-bones smart-pool (h/t [@yaron_velner](https://twitter.com/yaron_velner){target=_blank} )

2- incentivize large crypto actors to create block templates for miners (pays to smart pool)

3- incentivize pools to provide devOps & serve miners only such templates

4- incentivize Tx be sorted by fee

Idea 4 makes frontrunners pay the highest bid (so pools must pay their miners to include MEV Tx) Ideas 1-3 separate between block producer, mining devOps, and receiver of the reward.

## KeeperDAO

KeeperDAO is like a mining pool for Keepers. By incentivizing a game theory optimal strategy for cooperation among on-chain arbitrageurs, KeeperDAO provides an efficient mechanism for large scale arbitrage and liquidation trades on all DeFi protocols.

The Hiding Game

One of the 3 games that is built. This refers to the cooperation between users and keepers to “hide” MEV by wrapping trades/debt in specialised on-chain contracts. These contracts restrict profit extracting opportunities to KeeperDAO itself.

Here's the ELI5

Users route their trades and loans through KeeperDAO, which attempts to extract any arbitrage or liquidation profit available. Those profits are returned back to the user in $ROOK tokens, and profits go into a pool controlled by $ROOK holders. By giving KeeperDAO priority access to arbitrage and liquidations, the Hiding Game maximizes the profits available from these opportunities.

**<u>Links</u>**

[https://keeperdao.com/#/](https://keeperdao.com/#/){target=_blank}

Wiki [https://github.com/keeperdao/docs/wiki](https://github.com/keeperdao/docs/wiki){target=_blank}

## ArcherDAO

ArcherDAO seeks to help miners capture more MEV. Miners outsource their search for MEV to ArcherDAO and those who provide MEV will receive a cut.

**<u>Links</u>**

[https://medium.com/archer-dao/introducing-archer-66f20d2cc425](https://medium.com/archer-dao/introducing-archer-66f20d2cc425){target=_blank}
