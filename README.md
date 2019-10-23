# #6 Working with numbers

### Available numerical types

LIGO offers three built-in numerical types, and those are `int`, `nat` and `tez`.

### Addition

Addition in ligo is acomplished by using the `+` operator, however some type constraints apply, for example you can't add `tez + nat`.

Here's an example of how two `ints` can be added together
```
const a: int = 5 + 5;
```

However bits of the following example wouldn't compile, because adding an `int` with a `nat` produces an `int`, not a `nat`, similiar rules apply for `tez`:
```
// correct
const a: int = 5n + 10;
// wrong
const b: nat = 5n + 10;

const c: tez = 5mtz - 1mtz;
// mixing of tez with other types is also not possible
const d: tez = 5mtz - 5n;
```

A pro tip is that you can also use underscores for readability when defining numbers like this:

```
const a: int = 1_000_000;
```

> 💡 You can find more addition examples in `src/addition.ligo`

### Substraction

The simpliest substraction looks like this:

> ⚠️ Even when substracting two `nats`, the result is an `int`

```
const a: int = 5 - 10;
```

And again, substracting `tez`:

```
const a: tez = 5mtz - 1mtz;
```

### Multiplication

You can multiply values of the same type, such as:

```
const a: int = 5 * 5;
const b: nat = 5n * 5n;
// you can also multiply `nat` and `tez`
const c: tez = 5n * 5mtz;
```

### Division

In LIGO, you can divide `int`, `nat` and `tez`, here's how:

> ⚠️ Division of two `tez` values results into a `nat`

```
const a: int = 10 / 3;
const b: nat = 10n / 3n;
const c: nat = 10mtz / 3mtz;
```

---
## 🛠 Exercises


### #1 Chaining mathematical operations

For the sake of exercise, try chaining multiplication and division, or other math combinations.

> Solution can be found at the solutions folder, and evaluated using:
> ```
> ligo evaluate-value -s pascaligo exercises/\#1-chaining-mathematical-operations/solution/math.ligo a
> ```