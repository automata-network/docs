# Examples

## Front-Running

Front-running is the process by which an adversary observes transactions on the network layer and then acts upon this information by, for instance, issuing a competing transaction, with the hope that this transaction is mined before a victim transaction e.g. Transaction A is broadcasted with a higher gas price than an already pending transaction B so that A gets mined before B.

## Back-Running

Transaction A is broadcasted with a **slightly lower** gas price than already pending transaction B so that A gets mined **right** **after** B in the same block[^1].

Example of a back-running bot that back-runs new token listings. Bot monitors the Ethereum mempool for new pairs being created on Uniswap. If it finds a new pair the bot places a buy transaction immediately behind the initial liquidity. That way they can buy a new token before anyone else.

## Sandwich Attacks

Alice wants to buy a Token A on a Decentralised Exchange (DEX) that uses an automated market maker (AMM) model. A miner which sees Alice’s transaction can create two of its own transactions which it inserts before and after Alice’s transaction (sandwiching it). The miner’s first transaction buys Token A, which pushes up the price for Alice’s transaction, and then the third transaction is the miner’s transaction to sell Token A (now at a higher price) at a profit.

## Time-Bandit Attacks

Time-bandit attacks are attacks where miners rewrite blockchain history to steal funds allocated by smart contracts in the past. If block rewards are small enough compared to MEV, it can be rational for miners to destabilize consensus.

Imagine there are two miners, Sam and Dan, who are paid a $100 reward for each block they find. Sam has found 3 blocks, the first of which contained a $10,000 arbitrage opportunity.

Now Dan has a choice: he can either mine on top of Sam’s 3 blocks, or he can attempt to re-mine the first block in order to take the Uniswap arbitrage for himself. The $10,000 is much more lucrative than the $100 block reward, and Dan is more rational than honest, so he decides to re-mine the first block. While Dan’s at it, since the current longest chain is height 3, he also re-mines the second and third blocks (and captures any MEV that was in those, too). After the re-organization, Dan owns the longest chain and he and Sam can progress from the third block.

## Liquidations

* Fixed spread liquidation used by Compound, Aave, and dYdX allows a liquidator to purchase collateral at a fixed discount when repaying debt. 

    === "Strategy 1"

        A detects a liquidation opportunity at block B (i.e., after the execution of B). A then issues a liquidation transaction T, which is expected to be mined in the next block B +1. A attempts to destructively front-run other competing liquidators by setting high transaction fees for his liquidation transaction T.

    === "Strategy 2"

        A observes a transaction T, which will create a liquidation opportunity (e.g., an oracle price update transaction which will render a collateralized debt liquidatable). A then back-runs T with a liquidation transaction T~A~ to avoid the transaction fee bidding competition.


* The auction liquidation allows a liquidator to start an auction that lasts for a pre-configured period (e.g., 6 hours). Competing liquidators can engage and bid on the collateral price.


[^1]: <https://twitter.com/bertcmiller/status/1380866353347846145>{target=_blank}