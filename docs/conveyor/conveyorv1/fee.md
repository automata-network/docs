# Fee System

## Overview:

1)   The user submits a request to the Geode to perform a transaction. For example, swapping 100 gUSDC for 100 gDAI. `swapExactTokensForTokens()`

**Transitioning to Step 2:**
The Geode verifies that the amount of input token (USDC) is sufficient to pay for gas. The Geode can do this by simply calling the `getPrice()` method from `Fee.sol` to get USDC/ETH price in 18 decimals. For example, 1 USDC = 0.000361 ETH would yield 361000000000000. 

After Geode confirmed the user meets the minimum fee requirement, see step 2.

2)   The Geode estimates the gas limit and the gas price. The `Controller` would capture this information to perform another input token check on step 3.

3)    After the `Controller` finalizes the gas fee check, the `Controller` sends the transaction to `UniswapRouter02` to perform the swap. The Geode would pay the gas fee "out of pocket" here, to be reimbursed later on step 4. Then, calculates the actual amount of gas consumption at this point.

4)   Let's say the **fast** gas price is 49 gWei, with an average gas limit of 200,000 to perform a swap, the total gas fee (at the time of writing this) is 0.0098 ETH. The `Controller` then automatically allocates 25.48 gDAI to reimburse the Geode (or locks it in the contract itself). The user gets the remaining 74.52 gDAI.

## Price Feed oracles that are available on Chainlink

Click [here](https://docs.chain.link/docs/reference-contracts/) to find the oracle addresses for the following exchange rates.

### Ethereum Mainnet

- 1INCH / ETH
- AAVE / ETH
- ALPHA / ETH
- AMPL / ETH
- ANT / ETH
- BADGER / ETH
- BAL / ETH
- BAND / ETH
- BAT / ETH
- BNB / ETH
- BNT / ETH
- BTC / ETH
- BUSD / ETH
- BZRX / ETH
- CEL / ETH
- COMP / ETH
- COVER / ETH
- CREAM / ETH
- CRO / ETH
- CRV / ETH
- DAI / ETH
- DPI / ETH
- ENJ / ETH
- FIL / ETH
- FTM / ETH
- FTT / ETH
- GRT / ETH
- HEGIC / ETH
- HUSD / ETH
- KNC / ETH
- KP3R / ETH
- LINK / ETH
- LON / ETH
- LRC / ETH
- MANA / ETH
- MKR / ETH
- MLN / ETH
- MTA / ETH
- NMR / ETH
- OCEAN / ETH
- OGN / ETH
- OMG / ETH
- ORN / ETH
- PAX / ETH
- PAXG / ETH
- PERP / ETH
- RAI / ETH
- RARI / ETH
- REN / ETH
- REP / ETH
- RGT / ETH
- RLC / ETH
- RUNE / ETH
- SFI / ETH
- SNX / ETH
- SRM / ETH
- SUSD / ETH
- SUSHI / ETH
- TUSD / ETH
- UMA / ETH
- UNI / ETH
- USDC / ETH
- USDT / ETH
- UST / ETH
- WNXM / ETH
- WOM / ETH
- YFI / ETH
- YFII / ETH
- ZRX / ETH
