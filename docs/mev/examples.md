# Examples

## Front-running

Transaction A is broadcasted with a **higher** gas price than an already pending transaction B so that A gets mined **before** B.

## Back-running

Transaction A is broadcasted with a **slightly lower** gas price than already pending transaction B so that A gets mined **right** **after** B in the same block.

*Source:* [https://twitter.com/bertcmiller/status/1380866353347846145?s=20](https://twitter.com/bertcmiller/status/1380866353347846145?s=20){target=_blank}

Example of a back-running bot that back-runs new token listings. Bot monitors the Ethereum mempool for new pairs being created on Uniswap. If it finds a new pair the bot places a buy transaction immediately behind the initial liquidity. That way they can buy a new token before anyone else.

## Sandwich attacks

An automated market maker (AMM) allows assets to be traded without counterparties. Buying Token X from the AMM causes the price of Token X to rise (with respect to a paired asset). A miner can exploit this when Alice is about to buy some Token X in a transaction T. If the miner gets to include T in a block it mines, it can do the following.

The miner creates two of its own transactions, Tpre and Tpost and sandwiches T between them. In other words, it includes the three transactions in the order Tpre T, Tpost. The miner’s transaction Tpre buys some Token X, while its transaction Tpost sells the Token X it’s bought. Because Alice’s transaction T causes the price of Token X to rise, the miner makes money: It’s selling Token X for more than it paid for it.

Because the miner’s buy transaction, i.e., transaction Tpre also causes the price of Token X to rise, Alice pays more than she would have if she weren’t attacked by the miner. In other words, the miner is taking money from Alice.

## Time-bandit attacks

If block rewards are small enough compared to MEV, it can be rational for miners to destabilize consensus.

Imagine there are two miners, Sam and Dan, who are paid a $100 reward for each block they find. Sam has found 3 blocks, the first of which contained a $10,000 Uniswap arbitrage.

Now Dan has a choice: he can either mine on top of Sam’s 3 blocks, or he can attempt to re-mine the first block in order to take the Uniswap arbitrage for himself. The $10,000 is much more lucrative than the $100 block reward, and Dan is more rational than honest, so he decides to re-mine the first block.

While Dan’s at it, since the current longest chain is height 3, he also re-mines the second and third blocks (and captures any MEV that was in those, too). After the re-org, Dan owns the longest chain and he and Sam can progress from the third block.

## Liquidations

  1. Fixed spread liquidation used by Compound, Aave, and dYdX allows a liquidator to purchase collateral at a fixed discount when repaying debt.

    *Strategy 1*:  A detects a liquidation opportunity at block 𝐵𝑖 (i.e., after the execution of 𝐵𝑖 ). A then issues a liquidation transaction 𝑇𝐴, which is expected to be mined in the next block 𝐵𝑖+1. A attempts to destructively front-run other competing liquidators by setting high transaction fee for 𝑇𝐴.

    *Strategy 2*: A observes a transaction 𝑇𝑉 , which will create a liquidation opportunity (e.g., an oracle price update transaction which will render a collateralized debt liquidatable). A then back-runs 𝑇𝑉 with a liquidation transaction 𝑇𝐴 to avoid the transaction fee bidding competition.

  2. The auction liquidation allows a liquidator to start an auction that lasts for a pre-configured period (e.g., 6 hours). Competing liquidators can engage and bid on the collateral price.
