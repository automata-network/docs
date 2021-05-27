# Front-running as a Service (FaaS) or MEV Auctions (MEVA)

In a FaaS or MEVA system, MEV is extracted in a variety of ways such as miners auctioning off the right to front-run users.

!!! quote "Vitalik Buterin - [:fontawesome-brands-medium:](https://medium.com/@VitalikButerin/i-feel-like-this-post-is-addressing-an-argument-that-isnt-the-actual-argument-that-mev-auction-b3c5e8fc1021){align=right}"

     Centralizing MEV extraction is good because it quarantines a revenue stream that could otherwise drive centralization in other sectors. 

    <!-- [:fontawesome-brands-medium:](https://medium.com/@VitalikButerin/i-feel-like-this-post-is-addressing-an-argument-that-isnt-the-actual-argument-that-mev-auction-b3c5e8fc1021){align=right} -->


!!! quote "Phil Daian, co-author of Flash Boys 2.0 - [:material-link-variant:](https://pdaian.com/blog/mev-wat-do/){target=_blank}"

     In this article, I’m going to go deep into my personal arguments for why extracting MEV in cryptocurrencies isn’t like theft, why it is a critical metric for network security in any distributed system secured by economic incentives (yes, including centralized ones), and what we should do about MEV in the next 3-5 years as a community. 


    
## :pick: Private Transactions

Typically, transactions are broadcast to the mempool where they remain pending until miners pick them and add to the block. Private transactions however, are only visible to the pool and are not broadcast to other nodes (pay more for faster transactions).

Examples include [1inch Exchange's Stealth Transactions](https://help.1inch.io/en/articles/4695716-what-are-stealth-transactions-and-how-they-work){target=_blank}, [Taichi Network](https://taichi.network/){target=_blank} and [BloXroute](https://bloxroute.com/products/){target=_blank}.

[![](/assets/private_mempools.png){target=_blank}](https://taichi.network/){target=_blank}

[*<p align=center>Private Transactions offered by Taichi Network</p>*](https://taichi.network/){target=_blank}

[bloXroute Labs](https://bloxroute.com/){target=_blank} has a wide range of offerings and their core competency is low global latency for DeFi (8% of blocks mined within 1 sec).

!!! note

    For the other side of the coin, here is bloXroute Labs' take on why private mempools are not necessarily bad[^1]:

    1. Front-runners don't need these services to outpace regular users, who are slower by seconds. They need it to outpace one another, where improving speed 0.8->0.15 sec matters.
    2. When a transaction is privately sent to pools other frontrunners can't attempt to front-run it. This helps avoid fierce escalation of fees.
    
!!! info "Links"

    - [https://docs.bloxroute.com/apis/frontrunning-protection](https://docs.bloxroute.com/apis/frontrunning-protection){target=_blank}
    
## :pick: BackRunMe by bloXroute

BackRunMe is a service that allows users to submit private transactions (e.g. protection against frontrunning and sandwich attacks) while allowing searchers to backrun the transaction via MEV IF it produces an arbitrage profit. If it doesn't generate an arbitrage profit it is processed as a regular private transaction. BackRunMe, gives a portion of this additional profit back to the user. 

The profit sharing ratio is as follows: 50% to miners, 25% to users, 20% to searchers and 5% to bloXroute.

Users can use MetaMask directly on BackRunMe to trade on Uniswap or Sushiswap. 
    
!!! info "Links"

    - [https://backrunme.com/#/swap](https://backrunme.com/#/swap){target=_blank}
    - [https://medium.com/bloxroute/there-is-light-in-the-dark-forest-2d7b77f4ca2d){target=_blank}
    
## :pick: Flashbots

Flashbots is a research and development organization formed to mitigate the negative externalities and existential risks posed by MEV. They aim to Democratize MEV Extraction through MEV-Geth, which enables a sealed-bid block space auction mechanism for communicating transaction order preference.

!!! tip "ELI5"

    :fontawesome-brands-twitter: <https://twitter.com/_silto_/status/1381292907567722498>

Flashbots created an ETH node for miners, that not only watches the mempool like any other node, but also connects to a relayer (a server) operated by Flashbots. This MEV-Relay is a kind of parallel channel that directly connects miners to bots that want their transactions included.

The transactions that the bots want to include are sent through the MEV-Relay as bundles containing:

- the transactions to execute
- a tip to the miner, coming as an ETH transfer

These transactions use a 0 gwei gas price, as the payment to the miner is included in the transaction itself as the tip.

Since these transactions are sent through a parallel private relay, it reduces the mempool bidding war, failed transactions bloating the blockchain, and overall gas cost for users.

!!! info "Links"

    - GitHub: [https://github.com/flashbots](https://github.com/flashbots){target=_blank}
    - Research: [https://github.com/flashbots/mev-research](https://github.com/flashbots/mev-research){target=_blank}
    - Monthly Meetings: [https://github.com/flashbots/pm](https://github.com/flashbots/pm){target=_blank}
    - API: [https://blocks.flashbots.net/](https://blocks.flashbots.net/){target=_blank}
    - Discord: [https://discord.gg/7hvTycdNcK](https://discord.gg/7hvTycdNcK){target=_blank}
    - Medium: [https://medium.com/flashbots](https://medium.com/flashbots){target=_blank}
    - [https://medium.com/flashbots/frontrunning-the-mev-crisis-40629a613752](https://medium.com/flashbots/frontrunning-the-mev-crisis-40629a613752){target=_blank}
    - [https://medium.com/flashbots/quantifying-mev-introducing-mev-explore-v0-5ccbee0f6d02](https://medium.com/flashbots/quantifying-mev-introducing-mev-explore-v0-5ccbee0f6d02){target=_blank}
    - [https://ethresear.ch/t/flashbots-frontrunning-the-mev-crisis/8251](https://ethresear.ch/t/flashbots-frontrunning-the-mev-crisis/8251){target=_blank}

## :pick: mistX by alchemist

mistX is a DEX that enables end users to send transactions through Flashbots bundles. All transactions are gasless. However, instead of paying gas to the miners mistX users pay miners a bribe/tip in ETH. The tip is either included in the trade or comes from the user's wallet.

The exchange utilises Flashbots and as such transactions processed via mistX do not publish user transaction information to a public mempool, but instead bundle transactions together. This hides the information from front-runners and thus prevents transactions from being manipulated, front-run, or sandwiched.

!!! info "Links"

    - [https://app.mistx.io/#/exchange](https://app.mistx.io/#/exchange){target=_blank}

## :pick: KeeperDAO

KeeperDAO is similar to a mining pool for Keepers. By incentivizing a game theory optimal strategy for cooperation among on-chain arbitrageurs, KeeperDAO provides an efficient mechanism for large scale arbitrage and liquidation trades on all DeFi protocols.

### The Hiding Game

One of the 3 games that has been built. The Hiding Game refers to the cooperation between users and keepers to “hide” MEV by wrapping trades/debt in specialised on-chain contracts. These contracts restrict profit extracting opportunities to KeeperDAO itself.

### Here's the ELI5

Users route their trades and loans through KeeperDAO, which attempts to extract any arbitrage or liquidation profit available. Those profits are returned back to the user in $ROOK tokens, and profits go into a pool controlled by $ROOK holders. By giving KeeperDAO priority access to arbitrage and liquidations, the Hiding Game maximizes the profits available from these opportunities.

### kCompound (Phase 2 of the Hiding Game)

kCompound is the second phase of the Hiding Game. KeeperDAO posts collateral to save your position from being publicly liquidated. Instead, you get privately liquidated. KeeperDAO keeper will then find the best price for your collateral, targeting a 5% profit margin. This profit will then be split between you, the keeper, and the KeeperDAO treasury, meaning that kCompound borrowers will receive a portion of the profits from their own liquidation.

!!! info "Links"

    - [https://keeperdao.com/#/](https://keeperdao.com/#/){target=_blank}
    - Wiki: [https://github.com/keeperdao/docs/wiki](https://github.com/keeperdao/docs/wiki){target=_blank}
    - kCompound: [https://medium.com/keeperdao/introducing-kcompound-a23511c847a0](https://medium.com/keeperdao/introducing-kcompound-a23511c847a0){target=_blank}

## :pick: ArcherSwap

Archerswap is a new DEX extension for Uniswap and Sushiswap that prevents frontrunning and offers traders zero slippage and zero cost cancellation swaps. This enables users to set slippage tolerance to 0%. Miners will only be paid if "acceptance criteria" are met, so any transaction that fails is not included on chain. 

One is for searchers to submit Flashbots-compatible bundles.  The other is the Archer Relay Network (powers Archerswap) where users can submit private transactions and be protected from malicious MEV. 

!!! info "Links"

    - [https://swap.archerdao.io/#/swap](https://swap.archerdao.io/#/swap){target=_blank}
    
    ## :pick: Optimism

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

!!! info "Links"

    - [https://optimism.io/](https://optimism.io/){target=_blank}
    - [https://ethresear.ch/t/mev-auction-auctioning-transaction-ordering-rights-as-a-solution-to-miner-extractable-value/6788](https://ethresear.ch/t/mev-auction-auctioning-transaction-ordering-rights-as-a-solution-to-miner-extractable-value/6788){target=_blank}
    - [https://docs.google.com/presentation/d/1RaF1byflrLF3yUjd-5vXDZB1ZIRofVeK3JYVD6NPr30/edit#slide=id.gc9bdacc472_0_96](https://docs.google.com/presentation/d/1RaF1byflrLF3yUjd-5vXDZB1ZIRofVeK3JYVD6NPr30/edit#slide=id.gc9bdacc472_0_96){target=_blank}
    
    
## :pick: MiningDAO

MiningDAO is building a decentralized and transparent protocol for block formation that aims to pass 100% of MEV to miners. Anyone with an Ethereum address can propose the next block to be mined (via a block sealhash), and attach a bounty for successfully mining it. The mining pools would then mine on the highest-bounty proposal. 

One is for searchers to submit Flashbots-compatible bundles.  The other is the Archer Relay Network (powers Archerswap) where users can submit private transactions and be protected from malicious MEV. 

!!! info "Links"

    - [https://miningdao.io](https://miningdao.io){target=_blank}
    - [https://medium.com/mining-dao/introducing-miningdao-1e469626f7ad](https://medium.com/mining-dao/introducing-miningdao-1e469626f7ad){target=_blank}

## :pick: BackBone Cabal

BackBone Cabal is a strategy that aims to extract MEV from SushiSwap. Profits are redistributed back to users who submitted trades in the first place in the form of eliminating their transaction cost (up to 90%).

YCabal creates a virtualized mempool (i.e. a MEV-relay network) that aggregates transactions (batching).

Users are able to opt in and send transactions to YCabal and in return for not having to pay for gas for their transaction, YCabal batch processes it and takes the arbitrage profit.
Risk by inventory price risk is carried by a Vault, where Vault depositers are returned the profit the YCabal realizes.

!!! info "Links"

    - [https://backbonecabal.com/](https://backbonecabal.com/){target=_blank}
    - Knowledge Base: [https://backbone-kb.netlify.app/](https://backbone-kb.netlify.app/){target=_blank}
    - SushiSwap Proposal: [https://forum.sushiswapclassic.org/t/proposal-ycabal-mev-strategy/3159](https://forum.sushiswapclassic.org/t/proposal-ycabal-mev-strategy/3159){target=_blank}

[vitalik-meva]: https://medium.com/@VitalikButerin/i-feel-like-this-post-is-addressing-an-argument-that-isnt-the-actual-argument-that-mev-auction-b3c5e8fc1021

[^1]: https://twitter.com/bloXrouteLabs/status/1357026919905173509
