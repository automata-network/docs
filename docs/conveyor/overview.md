## Overview

![](../assets/conveyor_updated.png){style="zoom:80%"}

Automata Conveyor is a MEV Minimization solution that enforces fair ordering of transactions. The front-running-free-zone that ensures users are not disavantaged by overpaying on their transactions. 

Because blockchains are written by consensus and the content of each block is chosen by block producers - miners in PoW and validators in PoS systems - there is room and frankly, great incentive, for them to profit by front-running, back-running, sandwiching and generally exploiting transactions in their block. This is what is referred to as Maximal Extractable Value (MEV). 

## How it works 

When transactions are fed into Conveyor, the service ingest and outputs incoming transactions by a FIFO order. This means block producers cannot: 

- Inject new transactions into the Conveyor output. The inserted transactions bypassing Conveyor is detectable by anyone because of signature mismatch.
- Delete ordered transactions. Transactions accepted by Conveyor are broadcasted throughout the network so transactions cannot be deleted unless all block producers are colluding and censoring the transactions at the same time.
