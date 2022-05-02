# Workflow

![](../../assets/2fa/workflow.png)

### Key Components
* Primary wallet:

  The place where users store and control their assets.

* Recovery wallet:

  Used for identifying the users' roles and resetting the 2FA device, the relationship between the primary wallet and the recovery wallet is saved on-chain after binding.

* 2FA client:

  The device which provides the TOTP(Time-based one-time password).

<!-- * [Automata 2FA Guru](https://app.2fa.guru) -->
* Automata 2FA Guru

  The dApp hosted by the Automata team. It contains the 2FA management panel and wallet assets control panel. Users can sign up 2FA and find the 2FA protected dApps in the management panel, and they can make the authorised transfer under the wallet assets control panel.

* 2FA Guru Geode: 

  The 2FA middleware which is built upon the [Intel SGX](https://medium.com/atanetwork/introduction-to-sgx-the-eli5-3abf25e50057). With the provision of a secure, fully-shielded enclave, the platform connects seamlessly with dApps to provide support for 2FA verification on public blockchains. It's responsible for the 2FA secret generation, storage and authentication. The attackers cannot predict or calculate the valid signature outside the enclave, and its storage is encrypted by the enclave and the attackers cannot view anything even if they steal the data.

  Even though the assets are safe under the 2FA protection, it's still possible for attackers to steal the TOTP by using the phishing attack, and transfer the victims' 2FA protected assets. We introduce anti-phishing functionality to prevent it, our 2FA middleware can analyze the original domain and detect whether it's coming from the phishing domains or links by using the daily updated phishing blacklists. It will reject to provide a valid signature and keep users' assets safe. To meet the highest security, we also support a request domain whitelist for a specified dApp.