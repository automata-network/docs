# Legacy Contracts

## ConveyorV1: gTokens (Deprecated)

The initial development of Conveyor involves wrapping a tradable token, such as USDC, into anti-front running tokens known as gTokens. 

It also included a companion contract, known as the Controller, which ensured that the transfer of gTokens can only be done by a trusted relayer.

gTokens are now deprecated, in favor of XATA.

## ConveyorV2: XATA

The second iteration of Conveyor uses a Forwarder approach, which laid down the foundation for the latest iteration of Conveyor contracts, also known as Generic Conveyor.

In the case of XATA, we cloned the `UniswapV2` contracts and restrict the caller, such that it must only originate from authorized relayers. 

Eventually in the later phase, we introduced Generic Conveyor to provide a general purpose transaction-ordering solution.
