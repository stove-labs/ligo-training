# #8 Booleans and conditionals

### Boolean

The type of a Boolean is `bool` and the possible values are `True` and `False`.

Here's how to define a boolean:

```
const a: bool = True;
const b: bool = False;
```

### Comparing two values

In LIGO, only values of a certain type can be compared together, we call those of a comparable type. Comparable types include e.g. `int`, `nat`, `string`, `tez`, `timestamp`, `address`, ...

#### Comparing strings

```
const a: string = "Alice";
const b: string = "Alice";
// True
const c: bool = (a = b);
```

#### Comparing numbers

```
const a: int = 5;
const b: int = 4;
const c: bool = (a = b);
const d: bool = (a > b);
const e: bool = (a < b);
const f: bool = (a <= b);
const g: bool = (a >= b);
const h: bool = (a =/= b);
```

#### Comparing tez

> 💡 Comparing `tez` values is especially useful, when dealing with an `amount` sent in a transaction. Don't worry, you'll learn what `amount` represents in the upcoming chapters.

```
const a: tez = 5mtz;
const b: tez = 10mtz;
const c: bool = (a = b);
```

### Conditionals, if staments and more
 
Conditional logic is an important part of real world every program. 

#### If/else statements

```
const min_age: nat = 16n;

(*
    This function is a really obnoxious, but it serves a purpose of
    showcasing how the if statement and it's syntax can be used.

    Normally, you'd do `with (age > min_age)` instead.
*)
function is_adult(const age: nat): bool is 
    block { 
        var is_adult: bool := False;
        if (age > min_age) then begin
            is_adult := True;
        end else begin
            is_adult := False;
        end
    } with is_adult
```

> You can run the function above with
> ```
> ligo run-function -s pascaligo src/if-else.ligo is_adult 21n
> ```

---

## 🛠 Excercise

### Implement a name length validator function

Let's pretend we're trying to implement a contract, where we require a minimal string length for a name, in case the name is not long enough, our validation function will return `False`.
Your task is to implement a function, same as the `is_adult` in the example above, that will return `False` in case the provided parameter of type `string` will not be at least `5` characters long. Your function should be callable as `is_long_enough("name goes here")`.

> Solution can be found at the solutions folder, and ran using:
> ```
> ligo run-function -s pascaligo exercises/\#1-implement-a-name-length-validator-function/solution/validator.ligo is_long_enough '("Alice")'
> ```