# #9 Optionals and pattern matching

Optionals are a programing pattern seen e.g. in OCaml, and since Michelson and LIGO are both inspired from OCaml, you'll have the *option* to use them with LIGO as well.

## Variants

Variant is a user-defined, or a built-in type (in case of optionals), that can be compared to e.g. an Enum (from javascript).

Here's how to define a new variant type:

```
type id is nat
type user is
| Admin of id
| Manager of id
| Guest;

const u: user = Admin(1000n);
const g: user = Guest(Unit);
```

This can be extremely useful when trying to build semantically appealing contracts. We'll learn how to use variants for 'logic purposes' shortly.

### Optional values

Optionals are a type of a built-in variant, that can be used to determine if a variable holds a certain value or not. This is especially useful, e.g. your program's state allows for a certain variable value to be empty, like this:

```
type dinner is option(string);

// stay hungry
const p1: dinner = None;
// have some hamburgers
const p2: dinner = Some("Hamburgers")
```

### Pattern matching

Pattern matching is very similiar to e.g. `switch` in Javascript, and can be used to re-route the program's flow based on a value of a variant. 

```
type dinner is option(string);
function is_hungry(const dinner: dinner): bool is block { skip } 
    with (
        case dinner of 
            | None -> True
            | Some(d) -> False
        end
    )
```
> You can run the example above with:
> ```
> ligo run-function -s pascaligo src/pattern-matching.ligo is_hungry 'Some("Hamburgers")'
> // Outputs: false
> ```