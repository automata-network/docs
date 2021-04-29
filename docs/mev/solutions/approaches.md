# Different approaches to tackling the MEV problem

There are largely 2 schools of thought when it comes to approaching the MEV problem

1. Offense - MEV is here to stay so let's find a way to extract and democratize it.
2. Defense - MEV is bad so let's try to prevent it.

As such we have put approaches into 2 categories

1. [Front-running as a Service (FaaS) or MEV Auctions (MEVA)](./faas-or-meva.md)
2. [MEV Minimization/Prevention](./mev-minimization-prevention.md)

At Automata Network we are in the Defense camp. Our solution [Conveyor](./mev-minimization-prevention.md#conveyor-the-automata-network-approach-to-tackling-mev) ingests transactions and outputs transactions in a determined order. This creates a front-running-free zone that removes the chaos of transaction reordering.
