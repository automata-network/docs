# Getting started with Automata Witness

<!-- ## Table of Contents

- [Getting started with Automata Witness](#getting-started-with-automata-witness)
  - [For Users](#for-users)
  - [For Project Builders](#for-project-builders)
    - [Adding Automata Network testnet to your networks](#adding-automata-network-testnet-to-your-networks)
    - [Connecting Your Metamask Wallet](#connecting-your-metamask-wallet)
    - [Creating a workspace](#creating-a-workspace)
    - [Creating a new proposal](#creating-a-new-proposal)
  - [Chainhook](#chainhook)
  - [Appendix](#appendix)
    - [Setting up MetaMask](#setting-up-metamask)
    - [Getting tokens](#getting-tokens)
      - [Getting ERC20 tokens in Ethereum kovan network](#getting-erc20-tokens-in-ethereum-kovan-network)
      - [Getting BEP20 tokens in Binance Smart Chain test network](#getting-bep20-tokens-in-binance-smart-chain-test-network)
    - [Supported Chain Info](#supported-chain-info)

-->



## For Users

As a community member, to make an anonymous vote, choose the specific blockchain network and head over to the proposal of a particular project you're interested in voting for. 

!!! attention

    Before making the vote, please ensure the following:

    - Your MetaMask wallet is connected to the corresponding network to which you are going to vote. You can get necessary info about the blockchain we supports [here](#supported-chain-info) and follow [instructions](#adding-automata-network-testnet-to-your-networks) similarly to add it to MetaMask wallet
    - Your account has the necessary ERC20/BEP20 token for the particular project **in the block height as snapshot**.

![](../assets/choosenetwork.png){width="673" height="463"}
![](../assets/voteproposal_2.png){width="673" height="463"}
![](../assets/blocksnapshot.png){width="673" height="463"}


!!! warning

    **If you do not have the necessary tokens for testnet, you can refer to the [Getting tokens](#getting-tokens) section for more information**

Once ready, you can perform the vote by clicking on the appropriate option. Note that the current strategy employed is to calculate the token balance for each voter at block height as snapshot regarding to each proposal.

![](../assets/voteproposal_2.png){width="673" height="463"}

The results of the proposal can be seen after it has been concluded and finalized.

For Private proposal - only the final winning option will be shown

![](../assets/result_private.png){width="673" height="463"}

For Medium proposal - the voting statics will also be shown for each option

![](../assets/result_medium.png){width="673" height="463"}

## For Project Builders

Project builders can create a workspace for hosting proposals created by them or other community members. Currently the metadata is stored on the [testnet](https://d.ata.network) of Automata Network, so to create workspaces or propsals, you will have to connect to the testnet.

### Adding Automata Network testnet to your networks  

You can then add the Automata Network to your existing networks with the following details:  

|        Field        |          Value           |
|:-------------------:|:------------------------:|
|  **Network Name**   |     Automata Network     |
|   **New RPC URL**   | https://rpc.ata.network/ |
|    **Chain ID**     |            86            |
| **Currency Symbol** |           ATA            |

The option to add networks can be found by clicking on:  

* **Profile Picture >> Settings >> Networks >> Add Network**  

or simply:

* **Network name >> Custom PRC**  

![](../assets/addingautomata_m.gif){width="673" height="463"}

### Connecting Your Metamask Wallet

If you see a **Connect wallet** or the **Not connected** text in your MetaMask, this means you are **not connected**!

![](../assets/check1_2.png){width="673" height="463"}
![](../assets/check2_2.png){width="673" height="463"}

You can follow the following steps to connect your wallet:  

- Click on the **Connect wallet** located at the top right corner
- Click on **MetaMask**
- Select the account you wish to connect with MetaMask
- Connect your account

![](../assets/connecting_m_2.gif){width="673" height="463"}

### Creating a workspace

You can create a workspace from the landing page of [Witness](https://witness.ata.network/).  

!!! tips
    Before creating a workspace for your token, please ensure the following:

    - **Your MetaMask wallet is connected to the Automata Network**
    - **Your account has the necessary ATA tokens**

    If you do not have the necessary tokens, you can refer to the [Getting tokens](#getting-tokens) section for more information.

Once ready, you can create a workspace by:

- Clicking on **Create** at the top right corner
- Choose the correct blockchain network for your workspace
- Fill in your workspace name
- Fill in your workspace spec
- Enter your token contract hash
- Click on **Create**

![](../assets/creatingworkspace_m_2.gif){width="673" height="463"}

### Creating a new proposal

Before any voting can begin, a proposal has to be made first. To do so, head over to the workspace of a particular project you're interested in creating a proposal for.  If the workspace has not been created yet, refer to [Creating a Workspace](#creating-a-workspace) to see how you can create one.

![](../assets/creatingproposal_2.png){width="673" height="463"}

!!! tips
    Before creating the proposal for your token, please ensure the following:

    - **Your MetaMask wallet is connected to the Automata Network**
    - **Your account has the necessary ATA tokens**

    If you do not have the necessary tokens, you can refer to the [Getting tokens](#getting-tokens) section for more information.

Once ready, you can create a proposal by:

- Clicking on **New Proposal** at the top right corner
- Fill in your proposal title
- Fill in your proposal's content
- Edit / Remove / Add your voting options
- Select the start and end date
- Click on **Publish**

![](../assets/creatingproposal_m_2.gif){width="673" height="463"}

## Chainhook

This feature enables calling of a particular on-chain method of a contract which was registered at proposal creation based on the result of proposal. It is still a beta version, thus only enabled for testnet workspaces currently. Each voting options can be backed with a chainhook optionally, you can create a chainhook for your option by:

- Clicking on **Add Chainhook** followed by the option field
- Choose the smart contract language for your chainhook
- Fill in the contract address to which your chainhook will take effect
- Fill in the function name
- Adding arguments for your callback function
  - each argument is paired with the type and the value field
  - Currently only `uint256, uint256[], address, address[]` are supported as argument type.
  - Follow the example for inputt value by hovering above the value field.


![](../assets/addchainhook.gif){width="673" height="463"}

## Appendix

### Setting up MetaMask

[MetaMask](https://metamask.io/) is a cryptocurrency wallet used to interact with the Ethereum blockchain. As it is required when using Automata Network, you can install the extension via the official download page [here](https://metamask.io/download.html), or simply add the extension for your browser via the following links below:

- [Chrome](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en)
- [Firefox](https://addons.mozilla.org/en-US/firefox/addon/ether-metamask/)
- [Brave](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en)
- [Edge](https://microsoftedge.microsoft.com/addons/detail/metamask/ejbalbakoplchlghecdalmeeeajnimhm?hl=en-US)

### Getting tokens
#### Getting ERC20 tokens in Ethereum kovan network 
To get your tokens, you can now head over to our faucet at <https://faucet.ata.network/>.

Simply copy the address of your account in MetaMask by clicking on **'Copy to Clipboard'** and paste the address into the input field for your desired token before clicking on the **Submit** button.  

![](../assets/gettingtoken1_m.gif){width="673" height="463"}

When receiving ERC-20 tokens, the relevant contract hash can be found in the adjacent blue badge, which you can copy by clicking on the **Copy** badge.  

![](../assets/gettingtoken2_m.gif){width="673" height="463"}

#### Getting BEP20 tokens in Binance Smart Chain test network
To get tokens in BSC test network, you can found the contract address using <https://testnet.bscscan.com/>, and use the faucet <https://testnet.venus.io/faucet> or <https://testnet.binance.org/faucet-smart> to get tokens.

### Supported Chain Info

|        Field        |          Value           |
|:-------------------:|:------------------------:|
|  **Network Name**   |        BSC mainnet       |
|   **New RPC URL**   | https://bsc-dataseed1.defibit.io/ |
|    **Chain ID**     |            56            |

|        Field        |          Value           |
|:-------------------:|:------------------------:|
|  **Network Name**   |        BSC testnet       |
|   **New RPC URL**   | https://data-seed-prebsc-1-s1.binance.org:8545/ |
|    **Chain ID**     |            97            |

- Ethereum mainnet and Kovan testnet are not listed here since they are natively supported by Metamask