# :beginner: Introduction

<!-- ![](/assets/mev_wiki.png) -->

This is a public resource for learning about **Miner Extractable Value**.

We cover a range of topics including the key concepts, research on this the topic, different approaches to tackling this issue and also Automata Network's approach.

!!! tip

    1. Find any errors? Click the :material-pencil: icon on each page to contribute.
    2. Want to share your feedback? Contact us [**here** :octicons-link-external-16:][feedback]{target=_blank}. 

## :bulb: What is Miner Extractable Value?

Miner Extractable Value refers to the amount of profit that miners can extract from reordering and censoring transactions on the blockchain.

## :bulb: Why does this happen?

When one sends a transaction on the blockchain, there is a delay between the time when the transaction is broadcast to the network and when it is actually mined into a block. During this period, transactiosn sit in a pending transaction pool called the mempool where contents are visible to everyone. Arbitrageurs and miners can monitor the mempool and find opportunities to maximize their own profits e.g. by frontrunning transactions. If a front-runner is a miner, they can also reorder or even censor transactions.

## :bulb: Why does this matter[^1]?

### MEV can harm users

MEV is an invisible tax that miners can collect from users.

### MEV can destabilize Ethereum

If block rewards are small enough compared to MEV, it can be rational for miners to destabilize consensus by reordering or censoring transactions.

## :bulb: Just how bad is the problem?

The [Flashbots Dashboard :octicons-link-external-16:][flashbot-dashboard]{target=_blank} tracks Extracted MEV over time.

It is estimated that >$500M has been extracted since 1st January 2020.

[Dune Analytics :octicons-link-external-16:][dune-analytics]{target=_blank} tracks Gas consumption by back-running bots. 

[flashbot-dashboard]: https://explore.flashbots.net
[dune-analytics]: https://duneanalytics.com/phabc/backrunning-bots-gas-consumption
[feedback]: https://us2.list-manage.com/survey?u=ffeae60ea2fcc1c9fe0f8ce40&id=8d7d318a72&attribution=false

[^1]: According to <https://research.paradigm.xyz/MEV>
