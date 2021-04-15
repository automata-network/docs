# Attempts to Trick Bots

## Salmonella 

[:fontawesome-brands-github:](https://github.com/Defi-Cartel/salmonella){target=_blank}

Salmonella intentionally exploits the generalised nature of front-running setups. The goal of sandwich trading is to exploit the slippage of unintended victims, so this strategy turns the tables on the exploiters. It’s a regular ERC20 token, which behaves exactly like any other ERC20 token in normal use-cases. However, it has some special logic to detect when anyone other than the specified owner is transacting it, and in these situations it only returns 10% of the specified amount - despite emitting event logs which match a trade of the full amount.

## Kattana 

[:fontawesome-brands-twitter:](https://twitter.com/SiegeRhino2/status/1381035640989626369?s=20){target=_blank}

The Kattana team included a trap for front-running bots during their token listing. There is a line in the code that disallows the front-runner from selling all tokens. So a front-runner paid 68 ETH to the miner and ended up with tokens he wasn't able to sell.

## Another attempt to trick bots covered here

[:fontawesome-brands-twitter:](https://twitter.com/bertcmiller/status/1381296074086830091?s=20){target=_blank}

### Background

Instead of users paying transaction fees via gas prices, Flashbots users pay fees via a smart contract call which transfers ETH to a miner. Miners receive bundles of transaction from users and include the bundle that pays them the most. Users love this because they only pay for transactions that are included and they can determine the fee that they are going to pay.

Sandwich bots watch the mempool for users buying on DEXes and sandwich them: running the price up before the victim buys and dumping after for a profit. Those 3 txs (buy, victim transaction, sell) make up a bundle. Note the Sandwich sell transaction contains the smart contract payment to the miner. It's important that payment goes to the miner on the sell transaction! That should only happen after the bot has secured profit from selling the tokens bought in their front-run. If that sell fails then there is no payment to the miner, and thus their bundle shouldn't be included

To be even more secure, bots will simulate their transactions on local infrastructure. Bots won't send transactions unless the simulation goes well. Paying transaction fees only on the sell transaction of a sandwich should defend against this. No profit, no payment.

### Simulation vs Reality

Some really smart people found weaknesses among all of these defenses.

The first defense was that simulation was done with an ERC20 transfer function that checked to see if the block was a mined by Flashbots' miners, and if so it transfers way less out. Local simulations look fine but do not work in production.

### The second defense - Payment only on a sell transaction

Again: Sandwich bots make miner payment conditional on profit. That was broken by making the ERC20 token pay the miner. Thus even with the Sandwich bot sell failing, the miner would still get paid!

Here's what actually happened: Sandwich bot gets baited and buys 100 ETH of the poisonous token Poisonous token owner's bait triggers custom transfer function, which pays 0.1 ETH to the miner Sandwich bot's sell doesn't work because of the poisonous token. As the sandwich bot submitted these three transactions in a bundle all three were included: the successful buy, the bait, and the failed sell. The poisonous ERC20's payment via the custom transfer was what incentivized a miner to include it!

It is estimated that the first person to do this made about 100 ETH. You can see the poisoned ERC20 Uniswap transactions [here :octicons-link-external-16:](https://etherscan.io/token/0xe253a1f7d5818022661bfbd2cbe043b642b4eff9?a=0x01f8d5a4862d51d2cf0cf52ac900a4d60adaeee6){target=_blank}.

### From Victim to Predator

One of their victims was one the most successful Flashbots bot operators, and they immediately sprung into action. In a short period of time the victim turned into an apex predator. They launched a similar but slightly different ERC20 (YOLOchain), and ended up successfully baiting many more sandwichers. They made 300 ETH doing so!
