# 1 "exercises/#1-implement-a-name-length-validator-function/solution/validator.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "exercises/#1-implement-a-name-length-validator-function/solution/validator.ligo"
const min_length: nat = 5n;

function is_long_enough(const name: string): bool is 
    block { skip } with (size(name) >= min_length)
