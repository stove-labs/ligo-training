# #2 Contract lifecycle

Smart contracts on Tezos have a fairly straightforward lifecycle, even though it's not really a cycle, because they stay alive forever with the current protocol, so the cycle never ends.

## Implementing and compiling smart contract

In case your smart contract is implemented in a high level language such as LIGO, you'll have to compile your smart contract first. Here's an example of how to compile a contract from chapter #1:

```
ligo compile-contract ligo-counter.ligo main
// michelson output goes here
```

In any case, before you proceed to the deployment, you need to have a Michelson contract ready, either implemented directly, or compiled e.g. from LIGO.

## Deployment (Origination) of a smart contract 

If your contract is implemented in Michelson directly, or you have compiled your contract successfully, you need to deploy it. On Tezos, a deployment of a smart contract is called an origination. Here's an example of how a contract can be originated using the `tezos-client` CLI:

```
$ tezos-client originate contract counter for alice transferring 0 from alice running counter.tz --init '0'
```

The command above, will do the following:
- Deploy a contract from a file `counter.tz`
- Transfer `0 XTZ` to the deployed contract
- Initialise the storage value of the deployed contract to `0`

Important thing to be wary of when deploying, are the costs associated with an origination operation, those will include:

- `burns` - essentially a one-time payment to the network, for storing data on the chain. This includes storing the actual contract code, and the storage value as well.
- `fees` - standard operation fees apply here too, those go to the bakers who process our operation.

## Reading the storage of an originated contract

Once our contract is deployed, we should be able to read it's current storage. This can be done fairly easily using the `tezos-client`:

```
tezos-client get script storage for counter
// Outputs: 0
```

## Interaction with the originated contract

Once the contract is deployed, it can be interacted with by sending a transfer operation to it's `KT1...` address. This transaction can specify the entrypoint being invoked - `%add`, `%sub`, ... And can carry an argument for the entrypoint as well, e.g. `%add` `5`. Here's a full example:

```
tezos-client transfer 0 from alice to counter --entrypoint 'add' --arg '5'
```

In case the operation above is successfully included in the blockchain/network we're using, then the contract's storage would be updated from `0` to `5`.

> 💡 You can always double check the latest storage of a contract with `get script storage for <alias>`