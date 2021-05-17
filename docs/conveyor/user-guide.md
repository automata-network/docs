# Getting started
## Preparation
At first, you need to get some DAI and USDC tokens, the following steps show how to get these tokens on the Ethereum Ropsten testnet

1. using [ropsten faucet](https://faucet.ropsten.be/) to get eth of ropsten testnet
2. using [uniswap](https://app.uniswap.org/#/swap) to swap DAI and USDC, don't forget to connect to the ropsten test network in your Metamask
![](../assets/uniswap_swap_network.jpg){width="673" height="463"}
![](../assets/uniswap_swap_dai.jpg){width="673" height="463"}

## Deposit
In order to use conveyor, you need deposit your DAI and USDC to get the Wrapped token, such as gDAI or gUSDC
![](../assets/gtoken_gdai.jpg){width="673" height="463"}

1. Click `Deposit` and enter deposit amount
![](../assets/gtoken_gdai_deposit.jpg){width="673" height="463"}

2. Click `Deposit` again and use metamask to sign the transaction 
![](../assets/gtoken_gdai_sign.jpg){width="673" height="463"}

## Withdraw
You can withdraw your deposit at any time
1. Click `Withdraw` and enter amount
![](../assets/gtoken_gdai_withdraw.jpg){width="673" height="463"}

2. Click `Withdraw` again and use metamask to sign the transaction
![](../assets/gtoken_gdai_withdraw_sign.jpg){width="673" height="463"}

## Swap
Select the token pair, the `From` represents token you own, `To` represents the token you want to exchange. Then enter the amount of `From` token, and the amount of `To` token will be estimated automatically.
![](../assets/gtoken_swap.jpg){width="673" height="463"}

Then click `Swap` and confirm, also need to use Metamask to sign the transaction.

After the transaction is submitted, you can view the transaction on Etherscan
![](../assets/gtoken_swap_submitted.jpg){width="673" height="463"}

## Add Liquitity
You can add liquitity to a existing pool, or create a pair, the processes are similar
![](../assets/gtoken_add_liquitity.jpg){width="673" height="463"}

Choose the pair and enter the amount, then click `Supply` and sign transactions using Metamask
![](../assets/gtoken_add_liquitity_op.jpg){width="673" height="463"}

## Import Pool
After adding liquitity to some pool, you can import the pair for better management
![](../assets/gtoken_import_pool.jpg){width="673" height="463"}

You will see the pooled tokens, and you can add or remove liquitity from the quick entry
![](../assets/gtoken_import_result.jpg){width="673" height="463"}
