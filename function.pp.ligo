# 1 "src/function.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "src/function.ligo"
type my_lambda is (int -> int)

function add_one(const i: int): int is block {skip} with i + 1

function main (const fn : my_lambda) : int is
  block { skip } 
  with fn(1)
