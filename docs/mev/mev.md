# The Miner Extractable Value (MEV) Wiki

!!! info
    This is a public resource for learning about Miner Extractable Value. We cover a range of topics including the key concepts, research on this the topic, different approaches to tackling this issue and also Automata Network's approach. 
 
    Contact us if you wish to :

    1. Contribute to this free resource, or want to share your feedback [HERE](https://us2.list-manage.com/survey?u=ffeae60ea2fcc1c9fe0f8ce40&id=8d7d318a72&attribution=false){target=_blank}.

![](/assets/mev_wiki.png){target=_blank}{: style="zoom:100%"}

## Resource List

| Name                                                                                                                | Type           | URL                                                                                                  |
|---------------------------------------------------------------------------------------------------------------------|----------------|------------------------------------------------------------------------------------------------------|
| Miners, Front-Running-as-a-Service Is Theft                                                                         | Article        | [Link](https://www.coindesk.com/miners-front-running-service-theft){target=_blank}                                          |
| MEV and Me                                                                                                          | Article        | [Link](https://research.paradigm.xyz/MEV){target=_blank}                                                                    |
| Ethereum is a Dark Forest                                                                                           | Article        | [Link](https://medium.com/@danrobinson/ethereum-is-a-dark-forest-ecc5f0505dff){target=_blank}                               |
| Escaping the Dark Forest                                                                                            | Article        | [Link](https://samczsun.com/escaping-the-dark-forest/){target=_blank}                                                       |
| Smart Contract Security - Incentives Beyond the Launch by Phil Daian (Devcon4)                                      | Video          | [Link](https://www.youtube.com/watch?v=i-oWE8hg6-0&ab_channel=EthereumFoundation){target=_blank}                            |
| Enter the Dark Forest: the terrifying world of MEV and Flash bots                                                   | Video          | [Link](https://www.youtube.com/watch?time_continue=943&v=Wd0at2Pu6xY&feature=emb_logo&ab_channel=TheDefiant){target=_blank} |
| Frontrunning in Decentralized Exchanges, Miner Extractable Value, and Consensus Instability                         | Video          | [Link](https://www.youtube.com/watch?v=vR1v7AQ8i3k&ab_channel=IEEESymposiumonSecurityandPrivacy){target=_blank}             |
| How To Get Front-Run on Ethereum mainnet                                                                            | Video          | [Link](https://www.youtube.com/watch?v=UZ-NNd6yjFM&ab_channel=ScottBigelow){target=_blank}                                  |
| Flash Boys 2.0: Frontrunning, Transaction Reordering, and Consensus Instability in Decentralized Exchanges          | Research Paper | [Link](https://arxiv.org/abs/1904.05234){target=_blank}                                                                     |
| Quantifying Blockchain Extractable Value: How dark is the forest?                                                   | Research Paper | [Link](https://arxiv.org/abs/2101.05511){target=_blank}                                                                     |
| High-Frequency Trading on Decentralized On-Chain Exchanges                                                          | Research Paper | [Link](https://arxiv.org/abs/2009.14021){target=_blank}                                                                     |
| Frontrunner Jones and the Raiders of the Dark Forest: An Empirical Study of Frontrunning on the Ethereum Blockchain | Research Paper | [Link](https://arxiv.org/abs/2102.03347){target=_blank}                                                                     |

## Introduction

### What is Miner Extractable Value?

Miner Extractable Value refers to the amount of profit that miners can extract from reordering and censoring transactions on the blockchain.

### Why does this matter?

*Source:* [https://research.paradigm.xyz/MEV](https://research.paradigm.xyz/MEV){target=_blank}

**MEV can harm users**

MEV is an invisible tax that miners are collecting from users.

**MEV can destabilize Ethereum**

If block rewards are small enough compared to MEV, it can be rational for miners to destabilize consensus.

### Just how bad is the problem?

The Flashbots Dashboard tracks Extracted MEV over time [https://explore.flashbots.net](https://explore.flashbots.net){target=_blank}.
It is estimated that > $369.4M has been extracted since 1st January 2020.

## Terms and Concepts

**DeFi**

DeFi is a subset of finance-focused decentralized protocols that operate autonomously on blockchain-based smart contracts. The total value locked in DeFi amounts to >50B USD (Source: [https://defipulse.com/](https://defipulse.com/){target=_blank})

**Automated Market Maker**

A type of Decentralised Exchange. Contrary to traditional limit order-book-based exchanges (which maintain a list of bids and asks for an asset pair), AMM exchanges maintain a pool of capital (a liquidity pool) with at least two assets. A smart contract governs the rules by which traders can purchase and sell assets from the liquidity pool. The most common AMM mechanism is a constant product AMM, where the product of an asset 𝑥 and asset 𝑦 in a pool have to abide by a constant 𝑘. Examples of AMM Exchanges include [Uniswap](https://uniswap.org/){target=_blank}, [Sushiswap](https://sushi.com/){target=_blank}, [Balancer](https://balancer.exchange/#/swap){target=_blank}.

**Lending Platforms**

Debt is an essential tool in DeFi. Because DeFi applications typically operate without Know Your Customer (KYC), the borrower’s debt must be over-collateralized. Hence, a borrower must collateralize (lock) 150% of the value that the borrower wishes to lend out. The collateral acts as a security to the lender if the borrower doesn’t pay back the debt.

Examples of lending platforms include [Aave](https://aave.com/){target=_blank} and [Compound](https://compound.finance/){target=_blank}.

**Arbitrage**

Arbitrage is the simultaneous purchase and sale of the same asset in different markets in order to profit from differences in the asset's listed price. E.g. when a Uniswap pool’s assets become mispriced, a profit opportunity is created to arbitrage the Uniswap pool back to parity with other trading venues.

**Slippage**

When performing a trade on an AMM, the expected execution price may differ from the real execution price. That is because the expected price depends on a past blockchain state, which may change between the transaction creation and its execution — e.g., due to front-running transactions.

**Liquidations**

In Lending Platforms, if the collateral value decreases and the collateralization ratio decreases below 150%, the collateral can be freed up for liquidation. Liquidators can then purchase the collateral at a discount to repay the debt.

**Priority gas auctions (PGAs)**

Because pure arbitrage opportunities offer unconditional revenue, bots often compete against each other by bidding up transaction fees (gas) in PGAs. This drives up fees for other users.

**Transaction Ordering**

Blockchains typically prescribe specific rules for consensus, but there are only loose requirements for miners on how to order transactions within a block. Many attacks are centered around how miners order transactions within blocks.

## Examples

**Front-running**

*Transaction A is broadcasted with a **higher** gas price than an already pending transaction B so that A gets mined **before** B.*

**Back-running**

*Transaction A is broadcasted with a **slightly lower** gas price than already pending transaction B so that A gets mined **right** **after** B in the same block.*

*Source:* [https://twitter.com/bertcmiller/status/1380866353347846145?s=20](https://twitter.com/bertcmiller/status/1380866353347846145?s=20){target=_blank}

Example of a back-running bot that back-runs new token listings. Bot monitors the Ethereum mempool for new pairs being created on Uniswap. If it finds a new pair the bot places a buy transaction immediately behind the initial liquidity. That way they can buy a new token before anyone else.

**Sandwich attacks**

An automated market maker (AMM) allows assets to be traded without counterparties. Buying Token X from the AMM causes the price of Token X to rise (with respect to a paired asset). A miner can exploit this when Alice is about to buy some Token X in a transaction T. If the miner gets to include T in a block it mines, it can do the following.

The miner creates two of its own transactions, Tpre and Tpost and sandwiches T between them. In other words, it includes the three transactions in the order Tpre T, Tpost. The miner’s transaction Tpre buys some Token X, while its transaction Tpost sells the Token X it’s bought. Because Alice’s transaction T causes the price of Token X to rise, the miner makes money: It’s selling Token X for more than it paid for it.

Because the miner’s buy transaction, i.e., transaction Tpre also causes the price of Token X to rise, Alice pays more than she would have if she weren’t attacked by the miner. In other words, the miner is taking money from Alice.

**Time-bandit attacks**

If block rewards are small enough compared to MEV, it can be rational for miners to destabilize consensus.

Imagine there are two miners, Sam and Dan, who are paid a $100 reward for each block they find. Sam has found 3 blocks, the first of which contained a $10,000 Uniswap arbitrage.

Now Dan has a choice: he can either mine on top of Sam’s 3 blocks, or he can attempt to re-mine the first block in order to take the Uniswap arbitrage for himself. The $10,000 is much more lucrative than the $100 block reward, and Dan is more rational than honest, so he decides to re-mine the first block.

While Dan’s at it, since the current longest chain is height 3, he also re-mines the second and third blocks (and captures any MEV that was in those, too). After the re-org, Dan owns the longest chain and he and Sam can progress from the third block.

**Liquidations**

  1. Fixed spread liquidation used by Compound, Aave, and dYdX allows a liquidator to purchase collateral at a fixed discount when repaying debt.

    *Strategy 1*:  A detects a liquidation opportunity at block 𝐵𝑖 (i.e., after the execution of 𝐵𝑖 ). A then issues a liquidation transaction 𝑇𝐴, which is expected to be mined in the next block 𝐵𝑖+1. A attempts to destructively front-run other competing liquidators by setting high transaction fee for 𝑇𝐴.

    *Strategy 2*: A observes a transaction 𝑇𝑉 , which will create a liquidation opportunity (e.g., an oracle price update transaction which will render a collateralized debt liquidatable). A then back-runs 𝑇𝑉 with a liquidation transaction 𝑇𝐴 to avoid the transaction fee bidding competition.

  2. The auction liquidation allows a liquidator to start an auction that lasts for a pre-configured period (e.g., 6 hours). Competing liquidators can engage and bid on the collateral price.

## Recent attempts to trick bots

**Salmonella**

Salmonella intentionally exploits the generalised nature of front-running setups. The goal of sandwich trading is to exploit the slippage of unintended victims, so this strategy turns the tables on the exploiters. It’s a regular ERC20 token, which behaves exactly like any other ERC20 token in normal use-cases. However, it has some special logic to detect when anyone other than the specified owner is transacting it, and in these situations it only returns 10% of the specified amount - despite emitting event logs which match a trade of the full amount.

[https://github.com/Defi-Cartel/salmonella](https://github.com/Defi-Cartel/salmonella){target=_blank}

**Kattana**

The Kattana team included a trap for front-running bots. There is a line in the code that disallows the front-runner from selling all tokens. So a front-runner ended up with tokens he couldn't get rid of and paid 100 ETH + 68 ETH to the miner for it.

[https://twitter.com/SiegeRhino2/status/1381035640989626369?s=20](https://twitter.com/SiegeRhino2/status/1381035640989626369?s=20){target=_blank}

**Another attempt to trick bots covered here**

[https://twitter.com/bertcmiller/status/1381296074086830091?s=20](https://twitter.com/bertcmiller/status/1381296074086830091?s=20){target=_blank}

## Different approaches to tackling the MEV problem

Many approaches involve encrypting transactions such that miners are not able to see the content of transactions until they are included in a block.

There are 3 main ways this can be achieved

1. Using Trusted Hardware like Intel SGX
2. Time-lock Encryption
3. Threshold Encryption

There are largely 2 schools of thought when it comes to approaching the MEV problem

1. Offense - MEV is here to stay so let's find a way to extract and democratize it.
2. Defense - MEV is bad so let's try to prevent it.

As such we have put approaches into 2 categories

1. Front-running as a Service (FaaS) or MEV Auctions (MEVA)
2. MEV Minimization/Prevention

At Automata Network we are in the Defense camp. Our solution Conveyor uses privacy (SGX and ORAM) to minimize MEV.

## 1. Front-running as a Service(FaaS) or MEV Auctions (MEVA)

In a FaaS or MEVA system, instead of miners developing front-running expertise themselves, MEV is extracted in a variety of ways such as miners auctioning off the right to front-run users.

Vitalik on MEVA

> Centralizing MEV extraction is good because it quarantines a revenue stream that could otherwise drive centralization in other sectors.

[https://medium.com/@VitalikButerin/i-feel-like-this-post-is-addressing-an-argument-that-isnt-the-actual-argument-that-mev-auction-b3c5e8fc1021](https://medium.com/@VitalikButerin/i-feel-like-this-post-is-addressing-an-argument-that-isnt-the-actual-argument-that-mev-auction-b3c5e8fc1021){target=_blank}

### Optimism

Original proposers of MEVA and ETH 1.5.

MEV Auction (MEVA) is created, in which the winner of the auction has the right to reorder submitted transactions and insert their own, as long as they do not delay any specific transaction by more than N blocks.

![](/assets/mev_auction.png){target=_blank}{: style="zoom:100%"}

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

### Flashbots

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

### Private Mempools

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

### KeeperDAO

KeeperDAO is like a mining pool for Keepers. By incentivizing a game theory optimal strategy for cooperation among on-chain arbitrageurs, KeeperDAO provides an efficient mechanism for large scale arbitrage and liquidation trades on all DeFi protocols.

The Hiding Game

One of the 3 games that is built. This refers to the cooperation between users and keepers to “hide” MEV by wrapping trades/debt in specialised on-chain contracts. These contracts restrict profit extracting opportunities to KeeperDAO itself.

Here's the ELI5

Users route their trades and loans through KeeperDAO, which attempts to extract any arbitrage or liquidation profit available. Those profits are returned back to the user in $ROOK tokens, and profits go into a pool controlled by $ROOK holders. By giving KeeperDAO priority access to arbitrage and liquidations, the Hiding Game maximizes the profits available from these opportunities.

**<u>Links</u>**

[https://keeperdao.com/#/](https://keeperdao.com/#/){target=_blank}

Wiki [https://github.com/keeperdao/docs/wiki](https://github.com/keeperdao/docs/wiki){target=_blank}

### ArcherDAO

ArcherDAO seeks to help miners capture more MEV. Miners outsource their search for MEV to ArcherDAO and those who provide MEV will receive a cut.

**<u>Links</u>**

[https://medium.com/archer-dao/introducing-archer-66f20d2cc425](https://medium.com/archer-dao/introducing-archer-66f20d2cc425){target=_blank}

## 2. MEV Minimization/Prevention

At Automata Network we are in the Defense camp, where we use privacy (SGX and ORAM) to minimize MEV.

### Conveyor - The Automata Network approach to tackling MEV

[insert link here](https://docs.google.com/document/d/1B_2at8VjKAemN8t4AmE99BVFkeJypUafOFQ5-kAtaCU/edit#heading=h.tmrsl52w35x9){target=_blank}

### The Fair Sequencing Service by ChainLink

The idea behind FSS is to have an oracle network order the transactions sent to a particular contract SC, including both user transactions and oracle reports. Oracle nodes ingest transactions and then reach consensus on their ordering, rather than allowing a single leader to dictate it.

FSS is a framework for implementing ordering policies, of which [Aequitas](https://eprint.iacr.org/2020/269.pdf){target=_blank}) (protocol for order-fairness in addition to consistency and liveness) is one example. It can alternatively support simpler approaches, such as straightforward encryption of transactions, which can then be decrypted in a threshold manner by oracle nodes after ordering. It will also support various policies for inserting oracle reports into a stream of transactions. (It can even support MEV auctions, if desired.)

**<u>Links</u>**

[https://blog.chain.link/chainlink-fair-sequencing-services-enabling-a-provably-fair-defi-ecosystem/](https://blog.chain.link/chainlink-fair-sequencing-services-enabling-a-provably-fair-defi-ecosystem/){target=_blank}

White paper to be released later.


### Arbitrum by Offchain Labs

Arbitrum is against MEVA and FaaS.

Minimizing L2 MEV capabilities

3 Modes of Arbitrum:

**1. Single Sequencer: L2 MEV-Potential (\**\*Mainnet Beta)\*\****

For Arbitrum’s initial, flagship Mainnet beta release, the Sequencer will be controlled by a single entity. This entity has transaction ordering rights within the narrow / 15 minute window; users are trusting the Sequencer not to frontrun them.

**2. Distributed Sequencer With Fair Ordering: L2-MEV-minimized** *Mainnet Final Form*

The Arbitrum flagship chain will eventually have a distributed set of independent parties controlling the Sequencer. They will collectively propose state updates via [the first BFT algorithm that enforces fair ordering within consensus (Aequitas)](https://eprint.iacr.org/2020/269.pdf){target=_blank}. Here, L2 MEV is only possible if >1/3 of the sequencing-parties maliciously collude, hence “MEV-minimized.”

**3. No Sequencer: No L2 MEV**

A chain can be created in which no permissioned entities have Sequencing rights. Ordering is determined entirely by the Inbox contract; lose the ability to get lower latency than L1, but gain is that no party involved in L2, including Arbitrum validators, has any say in transaction ordering, and thus no L2 MEV enters the picture.

**<u>Links</u>**

[https://offchainlabs.com/](https://offchainlabs.com/){target=_blank}

[https://medium.com/offchainlabs/front-running-as-a-service-334c929c945](https://medium.com/offchainlabs/front-running-as-a-service-334c929c945){target=_blank}

[https://docs.google.com/document/d/1VOACGgTR84XWm5lH5Bki2nBcImi3lVRe2tYxf5F6XbA/edit](https://docs.google.com/document/d/1VOACGgTR84XWm5lH5Bki2nBcImi3lVRe2tYxf5F6XbA/edit){target=_blank}

### Vega Protocol

Vega's proposal is to add a module to blockchains that supports the concept of relative fairness so that competing transactions may be sequenced under a known and understood protocol, and not subject to a validator’s discretion.

"*If there is a time t such that all honest validators saw a before t and b after t, then a must be scheduled before b”.* This is a property that can be assured of at any time with a minimal impact on performance.

To get the best combination, their current approach is a hybrid of the two. In normal operation, the protocol will assure block fairness. If the network detects that this causes a bottleneck, it temporarily switches to the timed approach (thus sacrificing a little fairness for performance), before switching back once the bottleneck is resolved. However, Vega will ultimately make the level of fairness customisable by market.

**<u>Links</u>**

[https://vega.xyz/](https://vega.xyz/){target=_blank}

[https://blog.vega.xyz/new-paper-fairness-and-front-running-an-invitation-for-feedback-cbb39a1a3eb](https://blog.vega.xyz/new-paper-fairness-and-front-running-an-invitation-for-feedback-cbb39a1a3eb){target=_blank}

Wendy, the Good Little Fairness Widget [https://vega.xyz/papers/fairness.pdf](https://vega.xyz/papers/fairness.pdf){target=_blank}

Video [https://www.youtube.com/watch?v=KjfLj5fhkGQ&t=18s&ab_channel=VegaProtocol](https://www.youtube.com/watch?v=KjfLj5fhkGQ&t=18s&ab_channel=VegaProtocol){target=_blank}

### Veedo by StarkWare

VeeDo is StarkWare’s STARK-based Verifiable Delay Function (VDF), and its PoC is now live on Mainnet. VeeDo's time-locks allow information to be sealed for a predetermined period of time (during the sequencing phase), and then made public.

2 approaches using privacy to minimize MEV

1. Time-locks as part of the protocol layer
2. Time-locks on Ethereum with smart contracts - supported today

**<u>Links</u>**

[https://starkware.co/](https://starkware.co/){target=_blank}

[https://medium.com/starkware/presenting-veedo-e4bbff77c7ae](https://medium.com/starkware/presenting-veedo-e4bbff77c7ae){target=_blank}

[https://docs.google.com/presentation/d/1C_Rb_rtUXT2Nkettu_GPSlD9yCge8ioBNLRj5OBNbyY/edit#slide=id.gb576f94980_0_836](https://docs.google.com/presentation/d/1C_Rb_rtUXT2Nkettu_GPSlD9yCge8ioBNLRj5OBNbyY/edit#slide=id.gb576f94980_0_836){target=_blank}

### LibSubmarine

LibSubmarine is an open-source smart contract library that protects your contract against front-runners by temporarily hiding transactions on-chain.

**<u>Links</u>**

[https://libsubmarine.org/](https://libsubmarine.org/){target=_blank}

Video [https://www.youtube.com/watch?v=N8PDKoptmPs&feature=emb_imp_woyt&ab_channel=IC3InitiativeforCryptocurrenciesandContracts](https://www.youtube.com/watch?v=N8PDKoptmPs&feature=emb_imp_woyt&ab_channel=IC3InitiativeforCryptocurrenciesandContracts){target=_blank}

GitHub [https://github.com/lorenzb/libsubmarine](https://github.com/lorenzb/libsubmarine){target=_blank}

### Sikka

Sikka's MEV solution to censorship and frontrunning problems is using a technique called Threshold Decryption, as a plugin to the Tendermint Core BFT consensus engine to create mempool level privacy. With this plugin, users are able to submit encrypted transactions to the blockchain, which are only decrypted and executed after being committed to a block by a quorum of 2/3 validators.

**<u>Links</u>**

[https://sikka.tech/](https://sikka.tech/){target=_blank}

[https://docs.google.com/presentation/d/1tQEUpZjy_U9J-VQAx1Wf5W9oOX5rrCY3AwjAb7ZgA68/edit#slide=id.p](https://docs.google.com/presentation/d/1tQEUpZjy_U9J-VQAx1Wf5W9oOX5rrCY3AwjAb7ZgA68/edit#slide=id.p){target=_blank}

## B.Protocol

BProtocol aims to shift MEV to users 

Users interact with existing lending platforms via B.Protocol smart contract. Liquidity providers (LP) provide a cushion to user debt, which gives B.Protocol precedence over other liquidators. LPs share their profits with the users, where user reward is proportional to his user rating.

**<u>Links</u>**

[https://www.bprotocol.org/](https://www.bprotocol.org/){target=_blank}

[https://docs.google.com/presentation/d/13UNysGCX9ZJG20lKaxr_qbhgKwcuHACdwlhGNKtzGt4/edit](https://docs.google.com/presentation/d/13UNysGCX9ZJG20lKaxr_qbhgKwcuHACdwlhGNKtzGt4/edit){target=_blank}

## What Happens when Ethereum moves to Proof-of-Stake?

The move from PoW to PoS consensus means the Ethereum network becomes secured by a set validators, who stake their ETH and vote on consensus, as opposed to miners who run mining equipment to solve for the proof of work. This change of consensus is set to happen likely some time in 2021.

There is an ongoing discussion and you can follow this here

[https://hackmd.io/@flashbots/ryuH4gn7d](https://hackmd.io/@flashbots/ryuH4gn7d){target=_blank}

## Other Academic Papers

**Tesseract**

Tesseract proposes a front-running resistant exchange relying on Intel SGX as a trusted execution environment.

[https://eprint.iacr.org/2017/1153.pdf](https://eprint.iacr.org/2017/1153.pdf){target=_blank}

**Calypso**

Enables a blockchain to hold and manage secrets on-chain with the convenient property that it is able to protect against front-running.

[https://eprint.iacr.org/2018/209.pdf](https://eprint.iacr.org/2018/209.pdf){target=_blank}
