# #11 Maps and Records

So far we've seen pretty basic data types, however LIGO offers a bit more in terms of built-in constructs, such as Maps and Records.

### Maps

Maps are natively available in Michelson, and LIGO builds on top of them. A strong requirement for a Map is that it's keys need to be of the same type, and that type must be comparable.

Here's how a custom map type is defined:

```
type ledger is map(address, tez);
```

And here's how a map value is populated:

> Notice the `->` between the key an it's value and `;` to separate individual map entries

```
const ledger: ledger = map
    ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address) -> 1000mtz;
    ("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN": address) -> 2000mtz;
end
```

> `("<string value>": address)` means that we type-cast a string into an address

#### Accessing map values by key

If we want to access a balance from our ledger above, we can use the `[]` operator/accessor to read the associated `tez` value. However, the value we'll get will be wrapped as an optional, so in our case `option(tez)`, here's an example:

```
const balance: option(tez) = ledger[("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN": address)];
```

### Records

Records are a construct introduced in LIGO, and are not natively available in Michelson. The LIGO compiler translates records into Michelson `Pairs`.

Here's how a custom record type is defined:

```
type user is record 
    id: nat;
    is_admin: bool;
    name: string;
end
```

And here's how a record value is populated:

```
const user: user = record
    id = 1n;
    is_admin = True;
    name = "Alice";
end
```

#### Accessing record keys by name

If we want to obtain a value from a record for a given key, we can do the following:

```
const is_admin: bool = user.is_admin;
```

---

## 🛠 Excercise

### #1 Building a simple ledger

You should now be able to build a simple token ledger. The task is to build a ledger, that holds a map of `address -> ledger_entry_map` where `ledger_entry_map` is a `map(string, ledger_entry)` where the key in this map is a `token_id` representing a token name, e.g. `XTZ`. While `ledger_entry` itself is just a `nat` balance.

Second task is to implement a function `get_balance`, that returns a `nat` balance when given an `address` and a `token_id`.

> Solution can be found in the solutions folder and ran with
>```
>ligo run-function -s pascaligo exercises/\#1-building-a-simple-ledger/solutions/ledger.ligo get_balance '(("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN": address), "LIGO")'
```

