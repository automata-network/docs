# Frequently Asked Questions

### **1. Are the 2FA secrets different for each account?**

Of course. Each new account has a unique secret, which is replaced if a reset request is confirmed. Even with the same account, secrets are different across networks.

### **2. How long can I bind a recovery wallet?**

7 Days.

### **3. How long does it take to disable 2FA?**

7 Days.

### **4. Can I change my recovery wallet after binding?**

Unfortunately, no. Binding is permanent, so make sure to keep your recovery wallet safe - for one, don't use it in the same device as your primary wallet so that they are not compromised at the same time. 

### **5. During the setup process, what happens if I scan the QR code without inputting the 6-digit authentication code?**

2FA will not be successfully enabled for the account, and the authenticated code from its secret will not be authorized.

### **6. During the reset process, what if I scan the QR code without inputting the 6-digit authentication code?**

The new secret will not be stored in the 2FA storage. The user's old secret will remain active.

### **7. Can I use the same recovery wallet for more than one primary wallet?**

Yes.

### **8. What kinds of assets will be shown in the wallet assets management page?**

All 2FA protected assets and Top20 ERC20 tokens in each network.

- Polygon: https://polygonscan.com/tokens
