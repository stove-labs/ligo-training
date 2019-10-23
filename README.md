# #10 User defined functions

Writing code is fun, as long as it doesn't get out of hand. To make sure our code stays put, and doesn't turn into spaghetti, we can group certain logic into functions.

# Defining a function

Functions in LIGO are defined using the `function` keyword followed by their `name`, `parameters` and `return` type definitions.

Here's how you define a basic function that accepts two `ints` and returns an `int` as well:

```
function add(const a: int; const b: int): int is 
    block { skip } with a + b
```

Function body consists of two parts:

- `block {<code>}` - logic of the function
- `with <value>` - can be viewed as a return value of the function

> 💡 `skip` can be used as a placeholder for empty function blocks, when all the neccessary logic fits into `with` at the end.


Now it's time to combine our knowledge from the previous chapters, we know that `vars` can be used within functions, the same applies for `pattern matching` and `if statements`. 


---

## 🛠 Excercise

### #1 Build a function, that returns an optional reward

Build a function `check_reward(age: nat): option(reward)` where `reward is string`, that checks if the user is over `25 years old`. If the 'user' (age provided) is over `25n` then grant a reward, otherwise do not grant a reward. Try splitting up the logic into smaller functions.

> Solution can be found at the solutions folder, and ran using:
> ```
> ligo run-function exercises/\#1-build-a-function-that-returns-an-optional-reward/solution/reward.ligo check_reward '(27n)'
> ```