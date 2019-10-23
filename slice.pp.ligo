# 1 "exercises/#1-slice-a-word-in-half/solution/slice.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "exercises/#1-slice-a-word-in-half/solution/slice.ligo"
const name: string = "Thomas";
const half_length: nat = size(name) / 2n;
const slice: string = string_slice(0n, half_length, name);
const ts: timestamp = now;
