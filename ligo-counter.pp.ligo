# 1 "src/ligo-counter.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "src/ligo-counter.ligo"
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
