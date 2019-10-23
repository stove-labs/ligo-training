# #12 Sets, lists and tuples

Apart from complex data types such as `maps` and `records`, ligo also exposes `sets`, `lists` and `tuples`.

> ⚠️ Make sure to pick the appropriate data type for your use case, as it carries not only semantical, but also gas related costs.

### Sets

Sets are similar to lists, the main difference is that elements of a `set` are supposed to be *unique*.

Here's how you define a set:

```
type int_set is set(int);
const my_set: int_set = set 
    1; 
    2; 
    3; 
end
```

Check if an element exists in a set:
```
const contains_three: bool = my_set contains 3;
// or alternatively
const contains_three_fn: bool = set_mem(3, my_set);
```

Check the size of a set:
```
const set_size: nat = size(my_set);
```

Add or remove an element from a set:
```
const larger_set: int_set = set_add(4, my_set);
const smaller_set: int_set = set_remove(3, my_set);
```

Fold (reduce) a set:
```
function sum(const result: int; const i: int): int is block { skip } with result + i;
// Outputs 6
const sum_of_a_set: int = set_fold(my_set, 0, sum);
```

### Lists

Lists are similar to sets, but their elements don't need to be unique, and they don't offer the same range of built-in functions.

> 💡 Lists are useful when returning operations from a smart contract's entrypoint.

Here's how you define a list:
```
type int_list is list(int);
const my_list: int_list = list
    1;
    2;
    3;
end
```

You can append an element to a list using `cons`:
```
const larger_list: int_list = cons(4, my_list);
const even_larger_list: int_list = 5 # larger_list;
```

> 💡 Lists can be iterated, folded or mapped to different values. You can find additional examples [here](https://gitlab.com/ligolang/ligo/tree/dev/src/test/contracts) and other built-in operators [here](https://gitlab.com/ligolang/ligo/blob/dev/src/passes/operators/operators.ml#L59)

Mapping of a list:
```
function increment(const i: int): int is block { skip } with i + 1;
// Creates a new list with elements incremented by 1
const incremented_list: int_list = list_map(even_larger_list, increment);
```

Folding *(reducing)* of a list:
```
function sum(const result: int; const i: int): int is block { skip } with result + i;
// Outputs 6
const sum_of_a_list: int = list_fold(my_list, 0, sum);
```

### Tuples

Tuples are useful for carrying data that belong together, but don't necessarily have an index or a specific name.

Here's how you define a tuple:
```
type full_name is string * string;
const full_name: full_name = ("Alice", "Johnson");
```

You can access elements in the tuple by their index:
```
const first_name: string = full_name.1;
```

---

## 🛠 Exercises

### #1 Access control functions

Implement a program, that stores a set of `addresses` as owners, and implement a function, that checks if the provided address is indeed an `owner` of this program.

> Solution can be found in the solutions folder and ran with:
> ```
>ligo run-function -s pascaligo exercises/\#1-access-control-functions/solution/acl.ligo is_owner '(("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN": address))'
> ```

### #2 Find the oldest person in a list

Implement a program which stores a `list` of `persons`, where `person` is a `record` with `name` and `age` fields. Use `list_fold` to find the oldest person in the list.

> Solution can be found in the solutions folder and ran with:
> ```
>ligo evaluate-value -s pascaligo exercises/\#2-find-oldest-person-in-the-list/solution/oldest.ligo oldest_person
> ```

