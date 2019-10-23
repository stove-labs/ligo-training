# #7 Working with strings

### Defining a string

```
const a: string = "Hello Alice";
```

### Concatenating strings

Strings are concatenated using the `^` operator.

```
const name: string = "Alice";
const greeting: string = "Hello";
// Hello Alice
const full_greeting: string = greeting ^ " " ^ name;
```

### Slicing strings

Strings can be sliced using the built-in function `string_slice(offset, length, string)`

Here's how:
```
const name: string = "Alice";
// slice = "A"
const slice: string = string_slice(0n, 1n, name);
```

> ⚠️ Notice that the `offset` and slice `length` are `nats`

### Aquiring a length of a string

Length of a string can be found using the built-in function `size(string)`:

```
const name: string = "Alice";
// length = 5
const length: nat = size(name);
```

---

## 🛠 Exercise

### Slice a word in half

Find a sentence/name/word with an even number of characters, and combine your prieviously learned LIGO math skills, with your newly learned string skills to split it in half.

> Solution can be found at the solutions folder, and evaluated using:
> ```
> ligo evaluate-value -s pascaligo exercises/\#1-slice-a-word-in-half/solution/slice.ligo slice
> ```