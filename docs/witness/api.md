# Witness API

[JSON-RPC](https://en.wikipedia.org/wiki/JSON-RPC) is a remote procedure call protocol encoded in JSON. You can use this API to send queries to our Geode instance for Witness.

## Available Endpoints

| Provider(s) | URL(s) | 
|:--------:|:------:|
| Witness Geode Mainnet | [https://witness-geode-mainnet.ata.network:3350](https://witness-geode-mainnet.ata.network:3350){target=_blank} |

## JSON-RPC Methods

### geode_witness_vote

Submits a signed Vote message in EIP712 format. 

#### Endpoint 

`https://witness-geode-mainnet.ata.network:3350/v0/geode_witness_vote`

#### Return Code

Returns an integer representing the status of the operation.

| Return Code | Description         |
|:-----------:|:-------------------:|
| 0           | Success             |
| 1           | SignatureFailure    |
| 2           | ProposalNotActive   |
| 3           | AlreadyVote         |
| 4           | MissingWorkspace    |
| 5           | IncorrectChainId    |
| 6           | InternalError       |
| 7           | WorkspaceDataError  |
| 8           | ChainError          |
| 9           | InsufficientBalance |

The function takes in a signed vote in EIP712 format. 

#### Data Format

##### Request Format

```json
{
	"id": 0,
	"jsonrpc": "2.0",
	"method": "geode_witness_vote",
	"params": {
		"vote": SignedEIP712Vote
	}
}
```

##### *SignedEIP712Vote* Format

```json
{
    "msg": EIP712Vote,
    "v": U256,
    "r": H256,
    "s": H256,
}
```
``` javascript
{
    type: "object",
    properties: {
        msg: {type: "object"},
        v: {type: "string"},
        r: {type: "string"},
        s: {type: "string"}
    },
    required: ["msg", "v", "r", "s"]
}
```

##### *EIP712Vote* Format

```json
{
    "types": {
        "EIP712Domain": EIP712DomainType,
        "Vote": VoteType,
    },
    "domain": EIP712DomainData,
    "primaryType": String,
    "message": Vote,
}
```
```javascript
{
    type: "object",
    properties: {
        types: {
            type: "object",
            properties: {
                EIP712Domain: {
                    type: "array",
                    items: {
                        name: "string",
                        type: "string"
                    },
                    minItems: 4,
                    maxItems: 4
                },
                Vote: {
                    type: "array",
                    items: {
                        name: "string",
                        type: "string"
                    },
                    minItems: 4,
                    maxItems: 4
                },
            },
            required: ["EIP712Domain", "Vote"]
        },
        domain: {
            type: "object",
            properties: {
                name: "string",
                version: "string",
                chainId: "string",
                verifyingContract: "string"
            },
            required: ["name", "version", "chainId", "verifyingContract"]
        },
        primaryType: {type: "string"},
        message: {type: "object"}
    },
    required: ["types", "domain", "primaryType", "message"]
}
```

##### *Vote* Format

```javascript
{
    type: "object",
    properties: {
        voter: "string",
        proposal: "string",
        option: "number",
        timestamp: "number"
    },
    required: ["voter", "primaryType", "domain", "message"]
}
```

#### Sample JSON-RPC Request

```json
{
    "jsonrpc":"2.0",
    "method":"geode_witness_vote",
    "params":{
        "vote":{
            "msg":{
                "types":{
                    "EIP712Domain":[
                        {
                            "name":"name",
                            "type":"string"
                        },
                        {
                            "name":"version",
                            "type":"string"
                        },
                        {
                            "name":"chainId",
                            "type":"uint256"
                        },
                        {
                            "name":"verifyingContract",
                            "type":"address"
                        }
                    ],
                    "Vote":[
                        {
                            "name":"voter",
                            "type":"uint256"
                        },
                        {
                            "name":"proposal",
                            "type":"uint256"
                        },
                        {
                            "name":"option",
                            "type":"uint32"
                        },
                        {
                            "name":"timestamp",
                            "type":"uint64"
                        }
                    ]
                },
                "domain":{
                    "name":"Witness",
                    "version":"0.1.0",
                    "chainId":"42",
                    "verifyingContract":"0xdEB55768F6D1a3E6771A4096531aD6ea258A925e"
                },
                "primaryType":"Vote",
                "message":{
                    "voter":"0x0000000000000000000000007ef99b0e5beb8ae42dbf126b40b87410a440a32a",
                    "proposal":"0x10002c",
                    "option":2,
                    "timestamp":1617188809
                }
            },
            "v":28,
            "r":"0x491b2a733067508f789bb4d180329b1fd9327d79a8135997eada08b3217cbb72",
            "s":"0x4e48960bef350ea161c997c3c2e881329de0d09d4fddb5781c6719308cc6b260"
        }
    },
    "id":73
}
```

#### Sample Response

```json
{
    "jsonrpc":"2.0",
    "result":0,
    "id":73
}
```

#### Metamask Support

You can use Metamask for signing and sending the message by refering here: [Sign-Typed-Data-v4](https://docs.metamask.io/guide/signing-data.html#sign-typed-data-v4).
