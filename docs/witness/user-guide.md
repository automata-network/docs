# Getting started

<!-- ## Table of Contents

- [Getting started](#getting-started)
  - [For Users](#for-users)
  - [For Project Owners](#for-project-owners)
    - [Adding the Automata Network testnet to your network](#adding-the-automata-network-testnet)
    - [Connecting Your Metamask Wallet](#connecting-your-metamask-wallet)
    - [Creating a workspace](#creating-a-workspace)
    - [Creating a new proposal](#creating-a-new-proposal)
  - [Chainhook](#chainhook)
  - [Appendix](#appendix)
    - [Setting up MetaMask](#setting-up-metamask)
    - [Getting tokens](#getting-tokens)
      - [Getting ERC20 tokens (Ethereum Kovan Network)](#getting-erc20-tokens-ethereum-kovan-network)
      - [Getting BEP20 tokens in the Binance Smart Chain test network](#getting-bep20-tokens-in-the-binance-smart-chain-test-network)
    - [Supported Chain Info](#supported-chain-info)
    - [Get supported by Witness](#get-supported-by-witness)

-->

## For Users

- Connect to the corresponding network 
- Search for the project in the Search bar
- Cast your vote for an active proposal 

!!! Attention

    Before voting, make sure that:

    - Your MetaMask wallet is connected to the correct network. Read more about the blockchains we support [here](#supported-chain-info) 
    [here](#supported-chain-info) and follow these [instructions](#adding-the-automata-network-testnet) to add them to your wallet.
    - Your account has the necessary number of ERC20/BEP20 tokens to qualify for the vote as specified by the block height in the snapshot.

![](../assets/choosenetwork.png){width="673" height="463"}
![](../assets/voteproposal_2.png){width="673" height="463"}
![](../assets/blocksnapshot.png){width="673" height="463"}

!!! Note

    Find out how to obtain testnet tokens [here](#getting-tokens).

Results will be displayed after voting ends.

Private proposals: Only the final outcome is shown. 

![](../assets/result_private.png){width="673" height="463"}

Medium proposals: Number of votes for each option will be shown. 

![](../assets/result_medium.png){width="673" height="463"}

Public proposals: Voter information can be viewed by the public.

![](../assets/result_public.png){width="673" height="463}

## For Project Owners

There are a number of roles assigned with different levels of control. Project owners can create a workspace for hosting proposals. Project teams or community members are able to create proposals. Currently, the metadata is stored on the [testnet](https://d.ata.network) of Automata Network. Connect to the testnet to create workspaces or propsals.

### Adding the Automata Network testnet  

Add the Automata Network to your existing network using the following details:  

|        Field        |          Value           |
|:-------------------:|:------------------------:|
|  **Network Name**   |     Automata Network     |
|   **New RPC URL**   | https://rpcv3.ata.network/ |
|    **Chain ID**     |            86            |
| **Currency Symbol** |           ATA            |

Alternatively, add a new network by navigating to: 

* **Profile Picture >> Settings >> Networks >> Add Network**  

or:

* **Network name >> Custom RPC**  

![](../assets/addingautomata_m.gif){width="673" height="463"}

### Connecting Your Metamask Wallet

If the **Connect wallet** button continues to show up, you are **not connected**.

![](../assets/check1_2.png){width="673" height="463"}
![](../assets/check2_2.png){width="673" height="463"}

Follow these steps to connect your wallet:  

- Click on **Connect wallet** at the top right corner
- Click on **MetaMask**
- Select the account you wish to connect with MetaMask
- Connect your account

![](../assets/connecting_m_2.gif){width="673" height="463"}

### Creating a workspace

Create a workspace from the landing [page](https://witness.ata.network/).

!!! Tips

    Before creating a workspace for your token, ensure that:

    - **Your MetaMask wallet is connected to Automata Network**
    - **Your account holds the necessary ATA tokens**

    Jump ahead to [Getting tokens](#getting-tokens) for a detailed guide. 

Begin by:

- Clicking on **Create**
- Choose the correct blockchain network for your workspace
- Fill in your workspace name
- Fill in your workspace specifications
- Enter your token contract hash
- Click on **Create**

![](../assets/creatingworkspace_m_2.gif){width="673" height="463"}

### Creating a new proposal

Head over to the [workspace](#creating-a-workspace) to create a proposal. 

![](../assets/creatingproposal_2.png){width="673" height="463"}

!!! Tips

    Before creating a proposal, ensure that:

    - **Your MetaMask wallet is connected to Automata Network**
    - **Your account contains the necessary ATA tokens**

    Jump ahead to [Getting tokens](#getting-tokens) for a detailed guide.

Begin by:

- Clicking on **New Proposal** 
- Fill in your proposal title
- Fill in content for your proposal
- Add / Edit / Remove your voting options
- Select the start and end date
- Click on **Publish**

![](../assets/creatingproposal_m_2.gif){width="673" height="463"}

## Chainhook

This feature enables calling of the on-chain contract registered at proposal creation, across our list of supported [networks](../introduction/#feature-support).

Each voting option can be followed with a chainhook. Or, create a chainhook by:

- Clicking on **Add Chainhook** followed by the option field
- Choose the smart contract language for your Chainhook
- Fill in the contract address where your Chainhook will take effect
- Fill in the function name
- Add arguments for your callback function
  - Each argument is paired with the type and the value field
  - Currently only `uint256, uint256[], address, address[]` are supported as argument types
  - Follow the example for input value by hovering above the value field

![](../assets/addchainhook.gif){width="673" height="463"}

## Appendix

### Setting up MetaMask

[MetaMask](https://metamask.io/) is a cryptocurrency wallet used to interact with the Ethereum blockchain. Install the extension via the official download page [here](https://metamask.io/download.html), or simply add the extension for your browser using the links below:

- [Chrome](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en)
- [Firefox](https://addons.mozilla.org/en-US/firefox/addon/ether-metamask/)
- [Brave](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en)
- [Edge](https://microsoftedge.microsoft.com/addons/detail/metamask/ejbalbakoplchlghecdalmeeeajnimhm?hl=en-US)

### Getting tokens
#### Getting ERC20 tokens (Ethereum Kovan Network) 

- Get tokens from Automata's [faucet](https://faucet.ata.network).
- Copy the address of your account in MetaMask by clicking on **'Copy to Clipboard'** 
- Paste the address into the input field for your desired token.
- Click **Submit**. 

![](../assets/gettingtoken1_m.gif){width="673" height="463"}

When receiving ERC-20 tokens, the relevant contract hash can be found  next to the network name "Ethereum Kovan Network". This information can be copied by clicking on the **Copy** button.

![](../assets/gettingtoken2_m.gif){width="673" height="463"}

#### Getting BEP20 tokens in the Binance Smart Chain test network
- To get tokens in the BSC test network, search for the contract address using <https://testnet.bscscan.com/>. 
- Use the faucet <https://testnet.venus.io/faucet> or <https://testnet.binance.org/faucet-smart> to receive tokens.

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

|        Field        |          Value           |
|:-------------------:|:------------------------:|
|  **Network Name**   |    Plasm Dusty testnet   |
|   **New RPC URL**   | https://rpc.dusty.plasmnet.io:8545/ |
|    **Chain ID**     |            80            |

|        Field        |          Value           |
|:-------------------:|:------------------------:|
|  **Network Name**   |      Clover testnet      |
|   **New RPC URL**   | https://rpc.clover.finance/ |
|    **Chain ID**     |           1023           |

|        Field        |          Value           |
|:-------------------:|:------------------------:|
|  **Network Name**   | Dawinia Pangolin testnet |
|   **New RPC URL**   | https://pangolin-rpc.darwinia.network/ |
|    **Chain ID**     |            43            |

|        Field        |          Value           |
|:-------------------:|:------------------------:|
|  **Network Name**   |  Moonbase Alpha testnet  |
|   **New RPC URL**   | https://rpc.testnet.moonbeam.network/ |
|    **Chain ID**     |           1287           |

|        Field        |          Value           |
|:-------------------:|:------------------------:|
|  **Network Name**   |         Polygon          |
|   **New RPC URL**   | https://rpc-mainnet.matic.network |
|    **Chain ID**     |           137            |

|        Field        |          Value           |
|:-------------------:|:------------------------:|
|  **Network Name**   |        Avalanche         |
|   **New RPC URL**   | https://api.avax.network/ext/bc/C/rpc |
|    **Chain ID**     |          43114           |

- Ethereum Mainnet and Kovan Testnet are not listed here since they are supported by Metamask by deafult. 

### Get supported by Witness

We are happy to onboard more EVM networks onto Witness. Please provide the following details for us to get started with the integration: 

- Chain ID
- JSON-RPC URL
- Blockchain Explorer URL (optional)
- Faucet (for testnet) 
