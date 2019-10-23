# 1 "src/set.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "src/set.ligo"
type int_set is set(int);
const my_set: int_set = set 
    1; 
    2; 
    3; 
end;

const contains_three: bool = my_set contains 3;
const contains_three_fn: bool = set_mem(3, my_set);
const set_size: nat = size(my_set);
const larger_set: int_set = set_add(4, my_set);
const smaller_set: int_set = set_remove(3, my_set);

function sum(const result: int; const i: int): int is block { skip } with result + i;
const sum_of_a_set: int = set_fold(my_set, 0, sum);
