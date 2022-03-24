# Frequently Asked Questions

## General

### **1. What is NFTFair? How is this platform different from other NFT platforms? (e.g. OpenSea)**

NFTFair is a platform that integrates Conveyor to ensure NFTs are being distributed (or sold) fairly, in a manner which the average users should not be put in a disadvantage of getting frontrun by technologically sophisticated buyers or trading bots. Conveyor achieves Fairness by enforcing the correct ordering of transactions to reduce MEV. Click [here](https://www.ata.network/conveyor) to learn more about Conveyor's MEV minimization solution.

### **2. What is a Fairdrop?**

A Fairdrop is a single NFT distribution event being held for a certain duration. A vault contract is deployed and to be used **only** for a single Fairdrop event, which stores a fixed number of NFTs that is ready to be claimed by Fairdrop participants.

A user-facing activity site is also created for a Fairdrop event, for participants to easily interact with the vault contract to claim NFTs.

## Partners

### **1. Can I start a Fairdrop activity to sell or give away NFTs from an existing contract?**

Currently, this platform only supports NFT contract that follows the ERC721 standard.

Please reach out to us at [nftfair@ata.network](mailto:nftfair@ata.network), and we will gladly assist you with the deployment of your very own Fairdrop activity.

## Participants

### **1. Why am I not qualified to claim NFTs?**

Certain Fairdrop events may be limited for participants that are in a whitelist. If you are not an eligible participants, please reach out to the Fairdrop organizer directly, since we do not have control over whitelists.

### **2. How much does it cost to claim NFTs?**

The price varies by the Fairdrop event and its category. You can find NFT pricings on the activity site.

### **3. How many NFTs can I claim?**

This also varies by the event and its category. More info can be found on the activity site.

### **4. Why am I prompted to send an `approve()` transaction? What am I approving?**

If this is your first time using Conveyor, you are likely prompted to send at most two `approve()` transactions.

The first `approve()` transaction grants permission for the collection of **gas payment** ERC20 tokens. There are certain scenarios which may omit this requirement, such as:

- Certain Fairdrop events may be opting for relayer-sponsored transactions. In this case, users do not bear the cost of Conveyor transaction fees.
- User's token of choice has previously been approved for other Conveyor projects.

The second `approve()` transaction grants permission to the Treasury contract for collecting payment from NFT sales. This permission is valid for all vaults and other contracts on the platform that are receiving payments via the Treasury contract.


### **5. Why do I still have to sign two EIP712 messages?**

Sending `approve()` transactions as a mean of assigning allowance for the transfer of ERC20 tokens requires the users to hold native currencies to pay for gas. Requesting an approval for every single token transfers does not provide the smoothest user experience. A good workaround this issue is to allocate a very large amount of allowance for the spender, so users would only have to `approve()` once. This however, puts a huge trust on the spender to not drain the user's allowance at its will. To eliminate trust, the spender is subjected to a secondary approval process by requiring user's signed EIP 712 message, without needing to pay for gas.

The first signature is verified by the Conveyor relayer to collect ERC20 payment token, with the amount closely equivalent to the market gas price.

The second message is sent to the NFTPlatform treasury contract to collect sales payment for the purchase of NFTs. Users may not be required to sign this message, if an NFT were to be distributed free of charge.

<!-- ### **9. Some random question**

*Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum* -->