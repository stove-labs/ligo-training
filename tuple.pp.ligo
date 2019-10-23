# 1 "src/tuple.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "src/tuple.ligo"
type full_name is string * string;
const full_name: full_name = ("Alice", "Johnson");
const first_name: string = full_name.1;
