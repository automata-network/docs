## Homepage

The homepage is the main site where users can find a list of past, current and future Fairdrop events. Each activity contains information such as: 
- The launch network
- The event duration
- The template format
- The total number of NFTs
 
Users can click on the "Visit Activity Page" button to be redirected to the activity site. 

## Activity Sites

The activity site is where users participate in the Fairdrop event. To claim/purchase NFTs, users need to:

- Be eligible for the Fairdrop based on the launch requirements 
- Have a sufficient token balance for the asset they're transacting in, i.e. ERC20/BEP20 tokens. Users no longer need to hold platform native tokens such as ETH or BNB due to the nature of gasless transactions
- Make sure their total claim/purchase does not exceed the maximum limit
- Purchase NFT(s) within the duration of the event

## Approval 

Users may be prompted to submit an `approve()` transaction for an ERC20 token that do not have prior history with the protocol. In other words, an `approve()` transaction prompt is **always** required to authorize new ERC20 tokens to be used for payment to be collected by the Treasury contract.

Once all of the above conditions have met, users may select one (or more) category that they wish to claim an NFT from. Users are then prompted to sign two EIP712 messages for authentication.

- The first message gives permission to the Conveyor relayer to collect ERC20 payment token, with the amount closely equivalent to the market gas price.
- The second message gives permission to the NFTPlatform treasury contract to collect sales payment for the purchase of NFTs. Users may not be required to sign this message, if an NFT were to be distributed free of charge.

## Watch 

Check out this [video](https://www.youtube.com/watch?v=ihmXdG0efUE) to see NFTFair in action.
