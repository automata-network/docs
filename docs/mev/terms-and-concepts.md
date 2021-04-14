# Terms and Concepts

## DeFi

DeFi is a subset of finance-focused decentralized protocols that operate autonomously on blockchain-based smart contracts. The total value locked in DeFi amounts to >$50B USD (Source: [https://defipulse.com/](https://defipulse.com/))

## Automated Market Maker

A type of Decentralised Exchange. Contrary to traditional limit order-book-based exchanges (which maintain a list of bids and asks for an asset pair), AMM exchanges maintain a pool of capital (a liquidity pool) with at least two assets. A smart contract governs the rules by which traders can purchase and sell assets from the liquidity pool. The most common AMM mechanism is a constant product AMM, where the product of an asset 𝑥 and asset 𝑦 in a pool have to abide by a constant 𝑘. Examples of AMM Exchanges include [Uniswap](https://uniswap.org/), [Sushiswap](https://sushi.com/), [Balancer](https://balancer.exchange/#/swap).

## Lending Platforms

Debt is an essential tool in DeFi. As DeFi applications typically operate without Know Your Customer (KYC), the borrower’s debt must be over-collateralized. Hence, a borrower must collateralize (lock) 150% of the value that the borrower wishes to lend out. The collateral acts as a security to the lender if the borrower doesn’t pay back the debt. 

Examples of lending platforms include [Aave](https://aave.com/) and [Compound](https://compound.finance/).
## Arbitrage

Arbitrage is the simultaneous purchase and sale of the same asset in different markets in order to profit from differences in the asset's listed price. 

## Slippage

Slippage refers to situations in which a market participant receives a different trade execution price than intended. When performing a trade on an AMM, the expected execution price may differ from the real execution price because the expected price depends on a past blockchain state, which may change between the transaction creation and its execution — e.g., due to front-running transactions.

## Liquidations

In Lending Platforms, if the collateral value decreases and the collateralization ratio falls below 150%, the collateral can be freed up for liquidation. Liquidators can then purchase the collateral at a discount to repay the debt.

## Priority gas auctions (PGAs)

As pure arbitrage opportunities offer unconditional revenue, bots often
compete against each other by bidding up transaction fees (gas) in PGAs which drives up fees for other users.

## Transaction Ordering

Blockchains typically prescribe specific rules for consensus, but there are only loose requirements for miners on how to order transactions within a block. Many attacks are centered around how miners order transactions within blocks.