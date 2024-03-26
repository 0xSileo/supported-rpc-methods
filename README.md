# supported-rpc-methods
Website displaying which methods are supported by which common rpc endpoints

## Problem
While waiting for the `supportsMethod` method, we can query different enpoints for every JSON-RPC method and construct a table of supported methods. This could then be used to select an appropriate RPC endpoint.

## User notice

This code currently works but is not properly written. I'll clean it up and add instructions on how to run this properly. However go give feedback on the [`supportsMethod`](https://ethereum-magicians.org/t/eip-create-an-eth-supportsmethod-method-for-json-rpc/19247) proposal, as it would simplify the process significantly, whilst bringing other advantages.

## Utils

Scripts used to generate data and check method support are in [utils](utils/README.md)

## Results
Preliminary results are available in the [results](results/README.md) folder.
