# Getting started
## Preparation
At first, you need to get some DAI and USDC tokens, the following steps show how to get these tokens on the Ethereum Ropsten testnet

1. using [ropsten faucet](https://faucet.ropsten.be/) to get eth of ropsten testnet
2. using [uniswap](https://app.uniswap.org/#/swap) to swap DAI and USDC, don't forget to connect to the ropsten test network in your Metamask

![](../assets/uniswap_swap_network.jpg){width="673" height="463"}

!!! Note

    **Please connect your Metamask to the Ropsten Test Network**

## Deposit
In order to use conveyor, you need deposit your DAI and USDC to get the Wrapped token, such as gDAI or gUSDC

![](../assets/gtoken_gdai.jpg){width="673" height="463"}

1. Enter the deposit amount and click `Approve`(If you have already approved, please skip this step), then you need to confirm in the pop-up window of Metamask

![](../assets/gtoken_gdai_approve.jpg){width="673" height="463"}

2. Click the `Deposit` and confirm in Metamask
![](../assets/gtoken_gdai_deposit.jpg){width="673" height="463"}

## Withdraw
You can withdraw your deposit at any time
1. Click `Withdraw`, enter the amount in pop-up window and click `Withdraw` again, also need to confirm in Metamask

![](../assets/gtoken_gdai_withdraw.jpg){width="673" height="463"}

## Swap
Select the token pair, the `From` represents token you own, `To` represents the token you want to exchange. Then enter the amount of `From` token, and the amount of `To` token will be estimated automatically.

![](../assets/gtoken_swap_choose.jpg){width="673" height="463"}
![](../assets/gtoken_swap.jpg){width="673" height="463"}

Then click `Swap` and `Confirm Swap`, also need to use Metamask to sign the transaction.

After the transaction is submitted, you can view the transaction on Etherscan

![](../assets/gtoken_swap_submitted.jpg){width="673" height="463"}

You can change the transaction settings here

![](../assets/gtoken_swap_settings.jpg){width="673" height="463"}

If the pool does not exist, you will not allowed to swap

![](../assets/gtoken_swap_insufficient.jpg){width="673" height="463"}

## Add Liquitity
You can add liquitity to a existing pool, or create a pair. The operation processes are similar

![](../assets/gtoken_add_liquitity.jpg){width="673" height="463"}

Choose the pair and enter the amount, then click `Supply` and sign transactions using Metamask

![](../assets/gtoken_add_liquitity_op.jpg){width="673" height="463"}

## Import Pool
After adding liquitity to some pool, you can import the pair for better management

![](../assets/gtoken_import_pool.jpg){width="673" height="463"}

You will see the pooled tokens, and you can add or remove liquitity from the quick entry

![](../assets/gtoken_import_result.jpg){width="673" height="463"}
