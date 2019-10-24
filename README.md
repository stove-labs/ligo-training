# #13 Entrypoints and contracts

So far so good, we've learned enough of the LIGO language, we're confident enough to write out first smart contract.

We'll be implementing a counter contract, let's go.

### Entrypoints

Each LIGO smart contract is essentially a single function, that has the following *(pseudo)* type signature:

```
(const parameter: my_type, const store: my_store_type): (list(operation), my_store_type)
```

This means that every smart contract needs at least one entrypoint function, here's an example:

> 💡 The contract below literally does *nothing*

```
type parameter is unit;
type store is unit;
function main(const parameter: parameter; const store: store): (list(operation) * store) is
    block { skip } with ((nil : list(operation)), store)
```

Each entrypoint function receives two arguments:
- `parameter` - this is the parameter received in the invocation operation
- `storage` - this is the current (real) on-chain storage value

Storage can only be modified by running the smart contract entrypoint, which is responsible for returning a list of operations, and a new storage at the end of it's execution.

### Dry-running a contract

Testing a contract can be quite easy if we utilize LIGO's built-in dry run feature. Dry-run works by simulating the entrypoint execution, as if it were deployed on a real chain. You need to provide the following:

- `file` - contract to run
- `entrypoint` - name of the function to execute
- `parameter` - parameter passed to the entrypoint (in a theoretical invocation operation)
- `storage` - a mock storage value, as if it were stored on a real chain

Here's a full example:

```
ligo dry-run src/basic.ligo main Unit Unit
// Outputs:
// tuple[   list[]
//          Unit
// ]
```

Output of the `dry-run` is the return value of our entrypoint function, we can see the operations emited - in our case an empty list, and the new storage value being returned - which in our case is still `Unit`.

### Building a counter contract

Our counter contract will store a single `int` as it's storage, and will accept an `action` variant in order to re-route our single `main` entrypoint into two entrypoints for `addition` and `subtraction`. 

```
type action is
| Increment of int
| Decrement of int

function main (const p : action ; const s : int) : (list(operation) * int) is
  block {skip} with ((nil : list(operation)),
    case p of
    | Increment (n) -> s + n
    | Decrement (n) -> s - n
    end)
```

To dry-run the counter contract, we will use the `main` entrypoint, provide a variant parameter of `Increment(5)` and an initial storage value of `5`.

```
ligo dry-run src/counter.ligo main "Increment(5)" 5
// tuple[   list[]
//          10
// ]
```

Yay, our contract's storage has been successfuly incremented to `10`.

### Deploying and interacting with a contract on a live-chain

In order to deploy the counter contract to a real Tezos network, we'd have to compile it first, this can be done with the help of the `compile-contract` CLI command:

```
ligo compile-contract src/counter.ligo main
```

Command above will output the following Michelson code:

```
{ parameter (or (int %decrement) (int %increment)) ;
  storage int ;
  code { DUP ;
         CAR ;
         DIP { DUP } ;
         SWAP ;
         CDR ;
         DIP { DUP } ;
         SWAP ;
         IF_LEFT
           { DUP ;
             DIP 2 { DUP } ;
             DIG 2 ;
             DIP { DUP } ;
             SUB ;
             SWAP ;
             DROP ;
             SWAP ;
             DROP }
           { DUP ;
             DIP 2 { DUP } ;
             DIG 2 ;
             DIP { DUP } ;
             ADD ;
             SWAP ;
             DROP ;
             SWAP ;
             DROP } ;
         NIL operation ;
         PAIR ;
         SWAP ;
         DROP ;
         SWAP ;
         DROP ;
         SWAP ;
         DROP } }
```

However in order to originate a Michelson contract on Tezos, we also need to provide the initial storage value, we can use `compile-storage` to compile the LIGO representation of the storage to Michelson.

```
ligo compile-storage src/counter.ligo main 5
// Outputs: 5
```

In our case the LIGO storage value maps 1:1 to it's Michelson representation, however this will not be the case once the parameter is of a more complex data type, like a record.

> 💡 If you feel adventurous, you can go back to one of the precvious chapters and try out a real contract origination, this will require `tezos-client` and a `tezos-node` to be up and running first.

#### Invoking a LIGO contract

Same rules apply for parameters, as apply for translating LIGO storage values to Michelson. We will need to use `compile-parameter` to compile our `action` variant into Michelson, here's how:

```
ligo compile-parameter src/counter.ligo main 'Increment(5)'
// Outputs: (Right 5)
```

Now we can use `(Right 5)` which is a Michelson value, to invoke our contract - e.g. via `tezos-client`

--- 
## Extras

- [NFT implementation in LIGO](https://nft.stove-labs.com)
- [Timelocked multisig in LIGO](https://github.com/stove-labs/tutorials-ligo-timelocked-multisig)
- [LIGO docs](https://ligolang.org)

## 🛠 Exercises

This chapter does not contain any specific exercises, however feel free to hack with LIGO, and make sure to share your contracts!

## Social links

- [Stove Labs twitter](twitter.com/stove_labs)
