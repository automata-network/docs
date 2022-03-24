# Homepage

The homepage is the main site where users can find a listing of past, current and future Fairdrop events. Every activity in the list contains information about a particular Fairdrop event, such as the network, the length of duration, the type of Fairdrop and the total amount of NFTs on sale (or to be given away). Users can click on the "Visit Activity Page" button to be redirected to the activity site, which is created specifically for an individual event. 

---

# Activity Sites

The activity page is individually deployed and designated for a selected Fairdrop event. This user-facing site facilitates user interaction with the vault contract, as well as, providing detailed information about the Fairdrop, such as the remaining time, number of NFTs available to purchase, pricing and FAQs.

To claim/purchase NFTs, the user must satisfy all of the following conditions:

- Eligible to participate in the Fairdrop
- Users have the sufficient token balance to pay for transaction fee and NFT purchase
- User's total number of claim/purchase does not exceed the maximum limit.
- Users may only purchase NFT(s) within the duration of the event.

Users may be prompted to submit an `approve()` transaction for an ERC20 token that do not have prior history with the protocol. In other words, an `approve()` transaction prompt is **always** required to authorize new ERC20 tokens to be used for payment to be collected by the Treasury contract.

Once all of the above conditions have met, users may select one (or more) category that they wish to claim an NFT from. Users are then prompted to sign two EIP712 messages for authentication.

The first message gives permission to the Conveyor relayer to collect ERC20 payment token, with the amount closely equivalent to the market gas price.

The second message gives permission to the NFTPlatform treasury contract to collect sales payment for the purchase of NFTs. Users may not be required to sign this message, if an NFT were to be distributed free of charge.

Check out this [video](https://www.youtube.com/watch?v=ihmXdG0efUE) to see NFTFair in action.