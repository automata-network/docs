# 1RPC+

### Overview

1RPC+ is a subscription plan that offers users more granular, dynamic control of their personal data. 

The waitlist for 1RPC+ is now at capacity, and we will begin to invite users over the next few weeks. 

### Features

- ### Anti-phishing

    Anti-phishing rules help users to avoid interactions with bad actors and allows them to explore Web3 with greater confidence. With the support of application tools from some of the best security partners in the space, including AvengerDAO and GoPlus, users are warned away from a network of known, malicious addresses and contracts that is sourced, flagged and updated regularly over time. 

- ### Transaction Sanitizers 

     Transactions often feel intimidating because of a lack of transparency. Our goal is to give users on 1RPC+ a better understanding of how a dApp or smart contract interacts with their wallet. With transaction sanitizers that can be added or edited at any time, this reduces the likelihood of users ending up in unwanted situations. 

- ### Zero-tracking 

     The same rigorous standards of privacy-protection on 1RPC applies as well on 1RPC+. For a refresher on how the relay achieves zero-tracking, read [this](./design.md). 

### Transaction sanitizers

- #### Rate limitation
    * Rule ID: 001
    * Rule Details: If it reaches the daily rate limit, 1RPC+ will stop the upcoming requests until the following day (00:00 UTC).
    * Error code: -32001
    * Error message: Exceeded the quota usage
    * Example:
    ```shell
    {"jsonrpc": "2.0", "error": {"code": -32001, "message": "Exceeded the quota usage"}, "id": 1}
    ```

- #### Address whitelist/blacklist
    * Rule ID: 002
    * Rule Details: 1RPC+ will encrypt and save users’ customized address lists as a part of the customized configuration. Users can choose to use either whitelist or blacklist in this config. For each eth_sendRawTransaction request, 1RPC+ will decode and deserialize the interactive addresses, then validate these addresses by using users’ config.
    * Support methods:
        * approve
        * setApprovalForAll
        * transferFrom
        * safeTransferFrom
        * transfer
    * Error code: -32002
    * Error message: Blocked by 1RPC: invalid address. See https://rules.1rpc.io/002
    * Example:
    ```shell
    {"jsonrpc": "2.0", "error": {"code": -32002, "message": "Blocked by 1RPC: invalid address. See https://rules.1rpc.io/002"}, "id": 1}
    ```

- #### Uniswap recipient validation
    * Rule ID: 003
    * Rule Details: 1RPC+ will ensure beneficial address is the sender
    * Support networks & contracts
        * Ethereum Mainnet:
            * V3 Router: 0xE592427A0AEce92De3Edee1F18E0157C05861564
            * V3 Router2: 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45
            * V2 Router: 0xf164fC0Ec4E93095b804a4795bBe1e041497b92a
            * V2 Router2: 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
        * Polygon Mainnet:
            * V3 Router: 0xE592427A0AEce92De3Edee1F18E0157C05861564
            * V3 Router2: 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45
        * Optimism:
            * V3 Router: 0xE592427A0AEce92De3Edee1F18E0157C05861564
            * V3 Router2: 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45
        * Arbitrum One:
            * V3 Router: 0xE592427A0AEce92De3Edee1F18E0157C05861564
            * V3 Router2: 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45
        * Celo Mainnet:
            * V3 Router2: 0x5615CDAb10dc425a742d643d949a7F474C01abc4
    * Support methods:
        * V3 Router:
            * exactInput
            * exactInputSingle
            * exactOutput
            * exactOutputSingle
        * V3 Router2:
            * exactInput
            * exactInputSingle
            * exactOutput
            * exactOutputSingle
            * swapExactTokensForTokens
            * swapTokensForExactTokens
        * V2 Router:
            * swapExactTokensForTokens
            * swapTokensForExactTokens
            * addLiquidity
            * addLiquidityETH
            * removeLiquidity
            * removeLiquidityETH
            * removeLiquidityWithPermit
            * removeLiquidityETHWithPermit
            * swapETHForExactTokens
            * swapExactETHForTokens
            * swapTokensForExactETH
            * swapExactTokensForETH
        * V2 Router2:
            * swapExactTokensForTokens
            * swapTokensForExactTokens
            * addLiquidity
            * addLiquidityETH
            * removeLiquidity
            * removeLiquidityETH
            * removeLiquidityWithPermit
            * removeLiquidityETHWithPermit
            * swapETHForExactTokens
            * swapExactETHForTokens
            * swapTokensForExactETH
            * swapExactTokensForETH
            * removeLiquidityETHSupportingFeeOnTransferTokens
            * removeLiquidityETHWithPermitSupportingFeeOnTransferTokens
            * swapExactETHForTokensSupportingFeeOnTransferTokens
            * swapExactTokensForETHSupportingFeeOnTransferTokens
            * swapExactTokensForTokensSupportingFeeOnTransferTokens
    * Error code: -32003
    * Error message: Blocked by 1RPC: recipient is suspicious. See https://rules.1rpc.io/003
    * Example:
    ```shell
    {"jsonrpc": "2.0", "error": {"code": -32003, "message": "Blocked by 1RPC: recipient is suspicious. See https://rules.1rpc.io/003"}, "id": 1}
    ```

- #### GoPlus address scanning
    * Rule ID: 051
    * Rule Details: 1RPC+ will decode users' eth_sendRawTransaction request to deserialize the interactive addresses, and send these addresses to [Gopluslabs API](https://twitter.com/GoplusSecurity) to verify whether any of them is malicious, which should follow the Gopluslabs's [Terms of Use](https://gopluslabs.io/terms-of-use).
    * Support methods:
        * approve
        * setApprovalForAll
        * transferFrom
        * safeTransferFrom
        * transfer
    * Support networks:
        * Ethereum Mainnet
        * BNB Smart Chain
        * Polygon Mainnet
        * Fantom Opera
        * Arbitrum One
        * Avalanche
    * Error code: -32051
    * Error message: Blocked by 1RPC: malicious address. See https://rules.1rpc.io/051
    * Example:
    ```shell
    {"jsonrpc": "2.0", "error": {"code": -32051, "message": "Blocked by 1RPC: malicious address. See https://rules.1rpc.io/051"}, "id": 1}
    ```

- #### AvengerDAO address scanning
    * Rule ID: 052
    * Rule Details: Users can configure a trust level for the accounts the transaction is going to interact with, which will be used to compare with the [AvengerDAO Meter](https://www.avengerdao.org/) result. 1RPC+ will decode users' eth_sendRawTransaction request to deserialize the interactive addresses, and send these addresses to AvengerDAO Meter to verify whether any of them is potentially malicious by using the trust level comparison, which should follow the AvengerDAO's Terms of Use.
    * Support methods:
        * approve
        * setApprovalForAll
        * transferFrom
        * safeTransferFrom
        * transfer
    * Support networks: BNB Smart Chain
    * Error code: -32052
    * Error message: Blocked by 1RPC: insufficient trust score. See https://rules.1rpc.io/052
    * Example:
    ```shell
    {"jsonrpc": "2.0", "error": {"code": -32052, "message": "Blocked by 1RPC: insufficient trust score. See https://rules.1rpc.io/052"}, "id": 1}
    ```

- #### Explorer contract verification
    * Rule ID: 053
    * Rule Details: 1RPC+ will decode users' eth_sendRawTransaction request to deserialize the interactive contracts, and verify whether the contract is validated or not from the official blockchain explorer API.
    * Support networks and their terms of use:
        * Ethereum mainnet: [etherscan](https://etherscan.io/terms).
        * BNB smart chain: [bscscan](https://bscscan.com/terms).
        * Polygon mainnet: [polygonscan](https://polygonscan.com/terms).
        * Arbitrum One: [arbiscan](https://arbiscan.io/terms).
        * Moonbeam: [moonbeam](https://moonscan.io/terms).
        * Avalanche: [snowtrace](https://snowtrace.io/terms).
        * Optimism: [optimistic](https://optimistic.etherscan.io/terms).
        * Fantom Opera: [ftmscan](https://ftmscan.com/terms).
    * Error code: -32053
    * Error message: Blocked by 1RPC: unverified contract. See https://rules.1rpc.io/053
    * Example:
    ```shell
    {"jsonrpc": "2.0", "error": {"code": -32053, "message": "Blocked by 1RPC: unverified contract. See https://rules.1rpc.io/053"}, "id": 1}
    ```
