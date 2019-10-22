# #1 Introduction

This course has been created to help you learn the LIGO smart contract programing language, let's dive right into it.

## Chapters overview

The LIGO training course contains several chapters, most of those chapters start with a theoretical explanation, and ends with a practical exercise for the trainee to practice & verify his newly learned skills. At the end of the course, takeaway excercises / homework are also available, to further sharpen your understanding.

> ⚠️ Each chapter represents a branch in this git repository, please use the respective *branch switching* UI or the git CLI to switch between chapters.

Here's a quick overview of what you can learn:
- **#1 Introduction**
## Why does LIGO exist in the first place?

Before we get into why does LIGO need to exist in the first place, let's take a look at what options does the Tezos blockchain offer us out of the box. If you were to implement smart contracts natively on Tezos, you'd have to learn [Michelson](https://tezos.gitlab.io/master/whitedoc/michelson.html).

> The (Michelson) language is stack-based, with high level data types and primitives, and strict static type checking.


Here's an example of Michelson code:

**`counter.tz`**
```
{ parameter (or (or (nat %add) (nat %sub)) (unit %default)) ;
  storage int ;
  code { AMOUNT ; PUSH mutez 0 ; ASSERT_CMPEQ ; UNPAIR ;
         IF_LEFT
           { IF_LEFT { ADD } { SWAP ; SUB } }
           { DROP ; DROP ; PUSH int 0 } ;
         NIL operation ; PAIR } }
```

> The contract above maintains a number in its storage. It has two entrypoints (functions) add and sub to modify it, and the default entrypoint, of type unit will reset it to 0.

The contract itself contains three main parts:

- `parameter` - Argument that is provided by a transaction invoking the contract
- `storage` - Type definition for the contract's data storage.
- `code` - Actual Michelson code, that has the provided parameter & the current storage value in it's initial stack, and outputs a list of operations & a new storage value as it's resulting stack.

Michelson code consists of `instructions` like `IF_LEFT`, `PUSH ...`, `UNPAIR` that are bundled togeter in what is called a `sequence`. Stack represents an intermediate state of the program, while storage represents a persistent state. Instructions are used to modify the run-time stack in order to yield a desired stack value when the program terminates. 

### Differences between a stack and traditional variable management

Stack management might be a little bit challanging, especially if you're coming from a *C-like language*. Let's implement a similar program as above, in Javascript:

**`counter.js`**
```javascript
var storage = 0;

function add(a) {
    storage += a
}

function sub(a) {
    storage -= a
}

// We're calling this function reset instead of default
// because `default` is a javascript keyword
function reset() {
    storage = 0;
}
```

In our javascript program, the initial `storage` value is `0`, and it can be modified by running the functions `add(a)`, `sub(a)` and `reset()`. You can try running the program 👉[here](https://codepen.io/maht0rz/pen/dyyvoPQ?editors=0012) 👈.

### C-like smart contracts instead of Michelson

Unfortunately (?), we can't run Javascript on the Tezos blockchain at this moment, however we can opt-in for LIGO, which will abstract the stack management, and allow us to write readable, type-safe and efficient smart contracts.

Let's take a look at how a similar LIGO program would look like, don't worry if it's a little confusing at first, we'll explain all the syntactical bits in the upcoming chapters.

**`ligo-counter.ligo`**
```pascaligo
type action is
| Increment of int
| Decrement of int
| Reset of unit

function main (const p : action ; const s : int) : 
  (list(operation) * int) is
 block { skip } with ((nil : list(operation)),
  case p of
  | Increment(n) -> s + n
  | Decrement(n) -> s - n
  | Reset(n) -> 0
 end)
```

> 💡 You can find the Michelson compilation output of the contract above in **`ligo-counter.tz`**

The LIGO contract behaves exactly* like the Michelson contract we've seen first, and it accepts the following LIGO expressions/values: `Increment(n)`, `Decrement(n)` and `Reset(n)`. Those serve as an `entrypoint` identification, same as `%add` `%sub` or `%default` in the Michelson contract.

**not exactly, the Michelson contract also checks if the `AMOUNT` sent is `0`*

