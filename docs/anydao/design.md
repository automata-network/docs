# Design

## Architecture
The whole system for **AnyDAO MVP** is composed of 4 major components:

- **Substrate based blockchain**: Stores the related metadata and proofs for Projects and Proposals.
- **IPFS**: Stores the actual bits of the data such as texts, images and public voter information.
- **Geode**: It receives, queries and aggregates user votes. Also monitors the on-chain status and handles the uploading of IPFS storage and on-chain storage. At the same time it ensures the protection of user privacy.
- **Frontend**: It gathers all kinds of data and provides information via graphical interface, and provides interactivity for users to register projects, create proposals, cast votes and many more.

## Concept
### Project
It represents an entity of a DAO, the creator will be the default owner, and the owner has the right to update project configurations and even transfer the ownership to another address.
#### Workspace
Each project can configure multiple workspaces, each workspace is composed of a chain and strategies.
#### Strategy
It defines how to get the voting power of users from on-chain states, such as calculating by ERC20 token balance and so on.
### Proposal
A proposal stands for a topic where user can vote on with their assets.
#### Snapshot
For the fairness of all user voting assets, to avoid double-entrance, a snapshot mechanism is adopted in our design. When a proposal is started, the block height of each involved chain will be taken by our Geode, on which the state of each user will be fetched for power aggregation.
#### Privacy Level
There are currently 4 levels of privacy settings:<br>
- **Public**: Details of all individual votes made by users will be made available.<br>
- **Private**: Total amount of votes made per option will be made available as an aggregation while the individual vote is hidden.<br>
- **Mixed**: Users have the option to choose to reveal their vote or to cast their vote in the form of an aggregated result.<br>
- **Opaque**: Only the result of the vote is revealed, all other details are hidden, including aggregated vote amount.<br>
#### Update Frequency
It stands for how often Geode will execute transaction to update the on-chain states.<br>
The total number of updates for a proposal is calculated by the total voting duration divided by update frequency.<br>
As each execution generates transaction fee, the proposal creator need to pay certain amount of token according to the number of updating.<br>
If the update frequency is not enabled, Geode will only update the IPFS and on-chain state for once when the proposal is ended.
