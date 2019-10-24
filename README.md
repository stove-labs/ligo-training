# #5 Defining variables

In the previous chapters we've learned that LIGO abstracts away the stack management of Michelson, so we can focus on building contracts in a more accessible way. The basic building block right after types, are constants and variables.

### Constants

Constants are immutable by design, which means their values can't be reassigned.
When defining a constant, you need to provide a `name`, `type` and a `value`:

```
const age: int = 25;
```

You can evaluate the constant definition above using the LIGO compiler like this:

```shell
ligo evaluate-value -s pascaligo src/const.ligo age
# Outputs: 25
```

### Variables

Variables, unlike constants are mutable, but can't be used in a *global scope*, however they can be used within functions, or function arguments.

> Don't worry if you don't understand the function syntax yet, we'll get to it in the following chapters

```
function add(const a: int; const b: int) : int is
    block { 
        var c : int := a + b;
     } with c
```

> ⚠️ Notice the different assignment operator `:=`

You can evaluate the constant definition above using the LIGO compiler like this:

```shell
ligo run-function -s pascaligo src/add.ligo add '(1,1)' 
# Outputs: 2
```

---

## 🛠 Exercises

### #1 Variables in a global scope 

In this chapter we've learned that variables (not constants) cannot be used at the top level scope, try to define a `var` at a top level scope, and use `evaluate-value` to trigger a parser error related to the top level variable definition.

> Solution can be found at the solutions folder, and evaluated using:
> ```
> ligo evaluate-value -s pascaligo exercises/\#1-variables-in-a-global-scope/solution/variable.ligo age
> ```

### #2 Reassigning a variable value

Variables can be mutated, unlike constants, so in order to test it out, try re-using the variable example from this chapter, but instead of passing two `consts` as a function argument, try using `var`, so you can mutate the variables in the function body, instead of creating a new variable `c` to sum them up.

> Solution can be found at the solutions folder, and evaluated using:
> ```
> ligo run-function -s pascaligo exercises/\#2-reassigning-a-variable-value/solution/reassign.ligo reassign '5'
> ```
