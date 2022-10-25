## Overview

![](../assets/conveyor_updated.png){style="zoom:80%"}

Automata Conveyor is a MEV Minimization solution that enforces fair ordering of transactions. The front-running-free-zone that ensures users are not disavantaged by overpaying on their transactions. 

Because blockchains are written by consensus and the content of each block is chosen by block producers - miners in PoW and validators in PoS systems - there is room and frankly, great incentive, for them to profit by front-running, back-running, sandwiching and generally exploiting transactions in their block. This is what is referred to as Maximal Extractable Value (MEV). 

For example, a DEX can choose to accept either

  - Ordered transactions from Automata’s Conveyor which is free from transaction reordering and other front-running transactions
  - Other unordered transactions (which include front-running etc) that may negatively impact their users

Automata Conveyor contracts comprise the following components:

- `ConveyorForwarder`
- A target contract that extends the `ConveyorBase` contract.