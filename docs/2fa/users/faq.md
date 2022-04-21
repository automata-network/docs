# Frequently Asked Questions

## Users

### **1. Are the 2FA secrets different for each account?**

Yes, of course. Each signed up account has a unique secret, and it will be replaced if a reset request is confirmed. Furthermore, even with the same account, the secrets are different across networks.

### **2. How long can I bind a recovery wallet?**

7 Days.

### **3. How long is the disable 2FA cooldown window?**

7 Days.

### **4. Can I change my recovery wallet after binding?**

No you can't, once the binding is confirmed, it will persist forever, so please keep your recovery wallet safe and don't use it in the same device with the primary wallet.

### **5. During the setup process, what if I scan the QR code but don't input the 6-digit authentication code?**

The 2FA won't be enabled for this account, and the authenticated code from this secret won't be authorized.

### **6. During the reset process, what if I scan the QR code but don't input the 6-digit authentication code?**

The new secret won't be stored in the 2FA storage, and the old secret is still active.

### **7. Can I use the same recovery wallet for more than one primary wallet?**

Yes.

### **8. What kinds of assets will be shown in the wallet assets management page?**

All 2FA protected assets and some common ERC20 tokens, including ETH, BSCUSD, WBNB, USDC, XRP, ADA, AVAX, DOGE, DOT, UST, BUSD, SHIB, NEAR, DAI, LTC, ATOM, LINK, UNI, BCH, TRX.

## Developers

### **1. How can I integrate with the Automata 2FA protection?**

You can refer to smart contract part to see how to integrate with your contract, please make sure all assets ownership transfer operations should add **only2FA** modifier.