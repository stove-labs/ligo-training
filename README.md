# #4 Introduction to LIGO types

LIGO is strongly and statically typed, which means that the compiler checks your program at compilation time and makes sure there won't be any type related runtime errors. The language itself features types built on top of Michelson's type system.

### Available types

Here's a non-exhaustive list of available LIGO types. For a complete* reference with more examples you can check out the [LIGO Cheat Sheet](https://ligolang.org/docs/language-basics/cheat-sheet/).

**complete - work in progress*

-  Natural number
    ```
    nat
    ```
-  Integer
    ```
    int
    ```
-  String
    ```
    string
    ```
-  Boolean
    ```
    bool
    ```
-  Mutez (micro-tez)
    ```
    tez
    ```
-  Account address (tz1.., KT1..)
    ```
    address
    ```
-  Tuples
    ```
    (string * string)
    ```
- Variants carrying a value
    ```
    type action is 
    | Increment of int 
    | Decrement of int
    ``` 
    

- Optional values / variant of Some(of_type)/None
    ```
    option(of_type)
    ``` 
    
- Records
    ```
    type person is record
        age: int ;
    end
    ```
- Maps
    ```
    map(address, tez)
    ```
- Sets
    ```
    set(address)
    ```

### User defined types

As you've seen in the list of example LIGO types above, some types require the developer to define what his program actually needs to use, such as records. This gives us the ability to compose types together like this:

```
// Type aliasing
type age is nat;
type person is record
    // Comes in handy if we want to be more expressive
    age: age ;
end
```

---

## 🛠 Exercises

### #1 Defining a voting contract storage type

Best way to learn, is by practice, so let's try to define a new type called `voting_storage`,
which will represent the storage of our contract. Let's pretend we're running a presidential election on the chain, our storage needs to be a `map` of candidates, where the map key is an `address` of a candidate, and the value associated in this map is a `record`, which holds two `nat`(ural numbers) representing the number of votes, where voters can vote for `yay` or `nay` for the respective candidate.

#### Advanced

To spice things up, try using a `tuple` instead of a record, where the first element represents a *yay* vote, and the second element a *nay* vote.

> 💡 Solution can be found in the solutions folder