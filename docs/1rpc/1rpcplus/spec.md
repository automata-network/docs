# Specification

- ## Usage quota
    * Rule ID: 001
    * Rule Details: There is a default daily usage quota for each 1RPC+ user, and if it reaches the limitation, 1RPC+ will stop the upcoming requests until the following day (00:00 UTC).
    * Default quota: 40,000
    * Error code: -32001
    * Error message: Exceeded the quota usage
    * Example:
    ```shell
    {"jsonrpc": "2.0", "error": {"code": -32001, "message": "Exceeded the quota usage"}, "id": 1}
    ```

- ## Address whitelist/blacklist
    * Rule ID: 002
    * Rule Details: 1RPC+ users are able to create, edit and maintain one or many lists of addresses they trust or don't trust. 1RPC+ will encrypt and save these lists as a part of the customized configuration. For each eth_sendRawTransaction request, 1RPC+ will decode the addresses that the users interact with, then validate these addresses by using users’ config.
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

- ## Uniswap recipient validation
    * Rule ID: 003
    * Rule Details: 1RPC+ ensures that the recipient of a Uniswap transaction is the same as the sender of the transaction. In the event of a discrepancy, 1RPC+ will block the transaction.
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

- ## GoPlus address scanning
    * Rule ID: 051
    * Rule Details: 1RPC+ decodes the users' request to obtain addresses that they interact with, and check each of these addresses with [Gopluslabs API](https://twitter.com/GoplusSecurity) to verify whether any of them is malicious, By using this rule, users agree to Gopluslabs's [Terms of Use](https://gopluslabs.io/terms-of-use).
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

- ## AvengerDAO address scanning
    * Rule ID: 052
    * Rule Details: Users can configure a trust level for the accounts that the transaction is going tointeract with. 1RPC+ decodes the users' request to obtain the addresses that the user interacts with. For each of those addresses, 1RPC+ ensures that the trust score based on risk levels provided by [AvengerDAO Meter](https://www.avengerdao.org/docs/meter/consumer-api/Endpoints#data) satisfies the threshold specified by the user. By using this rule, users agree to AvengerDAO's Terms of Use.
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

- ## Explorer contract verification
    * Rule ID: 053
    * Rule Details: 1RPC+ will decode the transaction and ensure that the target contract address that the user is interacting with is verified on the chain's official explorer. e.g., etherscan for Ethereum. 
    * Support networks and their terms of use:
        * Ethereum mainnet: [etherscan](https://etherscan.io/terms).
        * BNB smart chain: [bscscan](https://bscscan.com/terms).
        * Polygon mainnet: [polygonscan](https://polygonscan.com/terms).
        * Arbitrum One: [arbiscan](https://arbiscan.io/terms).
        * Moonbeam: [moonscan](https://moonscan.io/terms).
        * Avalanche: [snowtrace](https://snowtrace.io/terms).
        * Optimism: [optimistic](https://optimistic.etherscan.io/terms).
        * Fantom Opera: [ftmscan](https://ftmscan.com/terms).
    * Error code: -32053
    * Error message: Blocked by 1RPC: unverified contract. See https://rules.1rpc.io/053
    * Example:
    ```shell
    {"jsonrpc": "2.0", "error": {"code": -32053, "message": "Blocked by 1RPC: unverified contract. See https://rules.1rpc.io/053"}, "id": 1}
    ```
