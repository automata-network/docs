# Run A Validator
## Introduction
You may want to run a validator, which means if you are elected into the validator set, you will be able to earn rewards. To run a validator, you need to run a validator node and stake some tokens, we will show you how to do it step by step.

## Steps
### Install Dependencies
- Install Docker
  - Please go to [this link](https://docs.docker.com/get-docker/) to download the docker engine for your Operating System accordingly.

### Create a Local Directory To Store the Chain Data
- You may need `sudo` permission to run the following commands.
  - Firstly create a folder to store the synchronized on-chain data
    ```
    mkdir /chain
    ```
  - Change the ownership and permission of your local storage directory to current user
    ```
    sudo chown -R $(id -u):$(id -g) /chain
    ```

### Launch the Validator Node
- Run the following command to launch a validator node, you may need `sudo` permission:
  ```
  docker run -it \
  -v "/chain:/data" \
  -u $(id -u ${USER}):$(id -g ${USER}) \
  -d \
  atactr/automata:contextfree-v0.1.0-rc4 \
  --node-type validator \
  --name <YOUR_NODE_NAME>
  ```
  - Which will return the **container ID** of your node
  - `<YOUR_NODE_NAME>` can be anything, but it's recommended to have something unique to make it easier to identify your node.
### Check Launch Status
- Check whether your node downloading blocks by checking the logs
  ```
  docker logs --follow <YOUR_CONTAINER_ID>
  ```
- If it works fine, the beginning of the log should look like<br>
  ![](../../assets/canaryimg/node_logs_2.png){width="673" height="463"}<br>

  - **Take note of your node identity behind `"Local node identity is: ..."`.** This will be very important for identifying your node on the Telemetry, as the node name can be duplicated.
  - Notice that you should have a **non-zero** number of `"peers"` connected as shown in the image above.
  - If the logs saying `"Error while dialing /dns/..."`, don't be panic, normally it may take a few minutes for the node to connect to the Telemetry server, after that the error will stop popping up.

### In order to display and output the desired result, you need to fall into your container
docker exec -t <YOUR_CONTAINER_ID>
apt-get -qq update
apt-get -qq -y install curl
### Get Session Keys Of Your Node
- Run the following command

    ```
    docker exec -t <YOUR_CONTAINER_ID> curl http://127.0.0.1:9933 -H "Content-Type:application/json;charset=utf-8" -d '{
        "jsonrpc":"2.0",
        "id":1,
        "method":"author_rotateKeys",
        "params": []
    }'
    ```
- You will get a response like this
  ```
  {
    "jsonrpc": "2.0",
    "result":"0xc05a9d093e4db4c1bde31977716e7a0a39d6f3d1f1bf749e7fec8371147de730af6860aeef81a11130c9fcd317b96e736f6c36141c28f382a18f9faf6e7df797eaa951ead00d12db10937003f0956e3d3444d1774d452ed045dbc1b84d1bf1471abf5d77bf5033845f01be1188a852c6f0ba703042b4d06d14314841c1096c50",
    "id":1
  }
  ```
- The content after `"result"` is the session keys of your validator node

### Set Up Accounts
- For running a validator, you need to set up two accounts:
  - `Stash account`: This account holds funds bonded for staking, but delegates some functions to the Controller account. It can be kept in a cold wallet, meaning it can stays offline all the time.
  - `Controller account`: This account acts on behalf of the Stash account, signalling decisions and necessary execution for staking. It only needs enough funds to pay transaction fees.
  - For more details, refer to [Polkadot Keys](https://wiki.polkadot.network/docs/learn-keys).
- For how to create accounts in ContextFree, you can refer [here](../userguide/accounts.md#create-account).

### Get Token
- Your Stash account and Controller account need to be funded with some native token
  - If you already had some native token on other account, you can simply transfer to the stash and controller accounts you have created, using the dashboard by opening the `Transfer` page under the `Accounts` tab.
  - If you don't have any native token, visit [Get Token from Faucet](../userguide/get-test-token.md) to get some native token.
  - Alternatively, if you have some [ContextFree ERC20 token](https://ropsten.etherscan.io/token/0x8289b901CAC48EbBB1B5cb0049d1459EA1240EF7), you can follow the [Token Bridge user guide](../userguide/token-bridge.md) to convert it into native token.

### Stake Tokens
- Visit the [Automata Dashboard](https://dashboard.ata.network/?rpc=wss%3A%2F%2Ffs-api.ata.network#/explorer)
-  Go to the `Staking` section.<br>
![](../../assets/canaryimg/validator/staking.png){width="673" height="463}<br>
- Set Stash and Controller.<br>
![](../../assets/canaryimg/validator/stash.png){width="673" height="463}<br>
- Choose the stash account and controller account accordingly, set the value for staking and press `Bond` to submit the transaction.<br>
![](../../assets/canaryimg/validator/bond.png){width="673" height="463}<br>

### Set Session Keys
- Click `Session Keys` and set the session keys you got previously.<br>
![](../../assets/canaryimg/validator/sessionkey.png){width="673" height="463}<br>
- If you are nominating someone, you need to stop nominating or you will not be able to set session keys.

### Set Validate Parameters
- Click `Validate`<br>
![](../../assets/canaryimg/validator/validate.png){width="673" height="463}<br>
- Set the value of `reward commission percentage`, which is the rate that your validator will be commissioned with. The remaining rewards will be split among your nominators.<br>
![](../../assets/canaryimg/validator/validate_2.png){width="673" height="463}<br>
- Besides, you can choose to accept nominating or not.

### Joining Validator Set
- If you go to the "Staking" tab, you will see a list of active validators currently running on the network. At the top of the page, it shows the number of validator slots that are available as well as the number of nodes that have signaled their intention to be a validator. You can go to the "Waiting" tab to double check to see whether your node is listed there.<br>
![](../../assets/canaryimg/validator/validatorset.png){width="673" height="463}<br>
- The validator set is refreshed every era. In the next era, if there is a slot available and your node is selected to join the validator set, your node will become an active validator. Until then, it will remain in the waiting queue. If your validator is not selected to become part of the validator set, it will remain in the waiting queue until it is. There is no need to re-start if you are not selected for the validator set in a particular era. However, it may be necessary to increase the number of native token staked or seek out nominators for your validator in order to join the validator set.

### Congratuation
If you have followed all of these steps, and been selected to be a part of the validator set, you are now running a ContextFree validator!
