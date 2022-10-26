# Developer guide

If you are interested in Conveyor, feel free to contact us to have an internal round development. Here are the basic development procedures:

1. Create your own smart contract based on the [ConveyorBase Contract](./conveyor-base.md), restrict the methods by using the `onlyConveyor` modifier to get the MEV protected benefit.

2. Deploy your target smart contract to any testnet, and you need to contact us to deploy the forwarder contract and a dedicated relayer backend in this testnet too.

3. Implement your own dApp by using [Conveyor SDK](./conveyor-sdk.md), specify the dedicated relayer url and forwarder address in previous step.

4. Start the internal tests in the testnet, especially focus on the methods which use `onlyConveyor` modifier.

5. If everything goes well during the testing, please contact us for the production deployment:

    * Automata team deploys a forwarder contract to the network where your dApp will be deployed.

    * Automata team deploys a dedicated relayer backend.

    * Automata team configures the relayer account to the forwarder contract.

    * The developer deploys the target contract in the same network.

    * The developer deploys the dApp with the conveyor-sdk, configuring the relayer url and forwarder address.

    * All deployments are done, make a final round test in the mainnet before publishing this dApp.

If you meet any issues during your development or deployment process, contact us for help.
