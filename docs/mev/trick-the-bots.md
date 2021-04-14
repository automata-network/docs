# Attempts to Trick Bots

## Salmonella

Salmonella intentionally exploits the generalised nature of front-running setups. The goal of sandwich trading is to exploit the slippage of unintended victims, so this strategy turns the tables on the exploiters. It’s a regular ERC20 token, which behaves exactly like any other ERC20 token in normal use-cases. However, it has some special logic to detect when anyone other than the specified owner is transacting it, and in these situations it only returns 10% of the specified amount - despite emitting event logs which match a trade of the full amount.

GitHub [https://github.com/Defi-Cartel/salmonella](https://github.com/Defi-Cartel/salmonella)

## Kattana

The Kattana team included a trap for front-running bots during their token listing. There is a line in the code that disallows the front-runner from selling all tokens. So a front-runner paid 68 ETH to the miner and ended up with tokens he wasn't able to sell.

[https://twitter.com/SiegeRhino2/status/1381035640989626369?s=20](https://twitter.com/SiegeRhino2/status/1381035640989626369?s=20)

## Another attempt to trick bots covered here

[https://twitter.com/bertcmiller/status/1381296074086830091?s=20](https://twitter.com/bertcmiller/status/1381296074086830091?s=20)