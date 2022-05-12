# Summary

This documentation outlines the contract specification of the platform. The contracts consist of three components:

- `NFTFairFactory` - The factory contract to deploy vaults based on a given template. Proxied by `NFTFairProxy` for upgradability.
- `NFTFairTreasury` - The central contract that collects sales revenues generated from vaults, and other protocol-related payment.
- `NFTFairVaultBase` - The base Vault contract that implements essential features of a vault, can be extended with additional implementations that are tailored to a specific template.

Currently, the platform supports the following templates:

- FIFO
- Mystery Boxes
- Minter Vault*

We plan to add more templates in the future.

*- The Minter vault is currently operating as it's own independent template at the moment. We planned to build the minting functionaiity on top of the existing templates in the short future. Keep an eye for an update.

---

# Addresses

## BSC

| Contract | Address |
| --- | --- |
| `NFTFairFactory (Implementation)` | [0x67F7e0C322a067C70e1eE99873Fe4163f4A02edD](https://bscscan.com/address/0x67f7e0c322a067c70e1ee99873fe4163f4a02edd) |
| `NFTFairFactory (Proxy)` | [0x062154774E1726246c75A4e8f05EDC675d8B39a1](https://bscscan.com/address/0x062154774E1726246c75A4e8f05EDC675d8B39a1) |
| `NFTFairTreasury` | [0x39c805A56EeF49BcD7C6c14d5dcf6e7f0daf63A4](https://bscscan.com/address/0x39c805A56EeF49BcD7C6c14d5dcf6e7f0daf63A4) |

## Polygon PoS

| Contract | Address |
| --- | --- |
| `NFTFairFactory (Implementation)` | [0xA97B472406b65e57D58E735D78E80e5586c1b526](https://polygonscan.com/address/0xa97b472406b65e57d58e735d78e80e5586c1b526) |
| `NFTFairFactory (Proxy)` | [0x062154774E1726246c75A4e8f05EDC675d8B39a1](https://polygonscan.com/address/0x062154774E1726246c75A4e8f05EDC675d8B39a1) |
| `NFTFairTreasury` | [0x514397BA31975E39c90475425bC8F3F26b313ed7](https://polygonscan.com/address/0x514397ba31975e39c90475425bc8f3f26b313ed7) |