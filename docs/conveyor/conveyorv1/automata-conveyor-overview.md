# Overview

Automata Conveyor is an anti-front-running service that ingests and outputs transactions in a determined order.

---

Automata Conveyor currently has the following components:

-  **gToken smart contract**: inherits the ERC20 contract with modified function methods that must be invoked by trusted Geode-provided addresses.

-  **Controller smart contract**: interacts with the users and facilitates the transfer of gTokens. External calls to any functions in the contract from any addresses other than the trusted relayers will be reverted.

-  **Automata Conciliator**: TBA

The following is an overview of the architecture.

![Protocol-overview](/assets/conveyorv1/conveyor-protocol-flowchart.svg)

!!! Note
    The Geode is an on-chain computation resource provided by the Automata network.


---

# Smart Contract Call Graph

The following call graph details the interaction among smart contracts.

![Call-graph](/assets/conveyorv1/conveyor-call-diagram.svg)
