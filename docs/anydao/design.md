# Design

## Architecture
**AnyDAO MVP** is composed of 4 major components:

- **Substrate based blockchain**: Stores the related metadata and proofs for Projects and Proposals.
- **IPFS**: Stores actual data such as texts, images and public voter information.
- **Geode**: Receives, queries and aggregates user votes. Also monitors the on-chain status and handles the uploading of IPFS storage and on-chain storage. At the same time, it ensures the protection of user privacy.
- **Frontend**: Gathers all kinds of data and provides information via graphical interface, and provides interactivity for users to register projects, create proposals, cast votes and many more.

## Concept
### Project
Represents the DAO. The creator is the default owner, and has the right to update project settings, as well as transfer the ownership to another address.
#### Workspace
Each project can configure multiple workspaces. Each workspace is composed of a chain and strategies
#### Strategy
Defines how to get the voting power of users from on-chain states, such as by calculating ERC20 token balance
### Proposal
Represents a topic where user can vote on with their assets
#### Snapshot
To ensure fairness and avoid double-entry, a snapshot mechanism is adopted in our design. When a proposal is started, the block height of each participating chain will be taken by our Geode, and the state of each user will be fetched for power aggregation.
#### Privacy Level
There are currently 4 levels of privacy settings:<br>
- **Public**: Details of all individual votes made by users will be made available.<br>
- **Private**: Total amount of votes for each option will be made available as an aggregation while the individual vote is hidden.<br>
- **Mixed**: Users have the option to choose to reveal their vote or to cast their vote in the form of an aggregated result.<br>
- **Opaque**: Only the result of the vote is revealed. All other details are hidden, including the aggregated vote amount.<br>
#### Update Frequency
- Stands for how often Geode executes transaction to update the on-chain state.<br>
- The total number of updates for a proposal is calculated by the total voting duration divided by update frequency.<br>
- Each execution generates a transaction fee and the proposal creator is responsible for this payment.<br>
- If the update frequency is not enabled, Geode will only update the IPFS and on-chain state when the proposal is ended.
