# Summary

Smart contracts that benefit from Automata 2FA protection must inherit from the `TwoFactorBase` contract. Any function calls that require 2FA protection must include the `only2FA` modifier.

2FA Guru relies on the `TwoFactorAuthentication` contract to: 

- (1) store the mapping between primary and recovery wallets, and 
- (2) verifies the authenticity of the transaction based on the provided signature from the relayer. 

The binding between a primary wallet and the recovery wallet is subjected to the usual 2FA workflow, as the Authenticator contract itself also extends the `TwoFactorBase` contract. After a user has completed the binding process, they can easily query their recovery wallet address by providing their primary wallet address.

Read the [next](./TwoFactorBase.md) section to learn more about the `TwoFactorBase` contract.