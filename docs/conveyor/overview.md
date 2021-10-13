# Automata Conveyor

Automata Conveyor is a service that ingests and outputs transactions in a determined order. 
This creates a front-running-free zone that removes the chaos of transaction reordering.

When transactions are fed into Conveyor, it determines the order of the incoming transactions and makes it impossible for block producers to perform the following:

  - Inject new transactions into the Conveyor output: The inserted transactions bypassing Conveyor is detectable by anyone because of signature mismatch.
  - Delete ordered transactions: Transactions accepted by Conveyor are broadcasted everywhere so transactions cannot be deleted unless ALL block producers are colluding and censoring the transactions at the same time.

From the DEX’s perspective, they can choose to accept either

  - Ordered transactions from Automata’s Conveyor which is free from transaction reordering and other front-running transactions
  - Other unordered transactions (which include front-running etc) that may negatively impact their users
