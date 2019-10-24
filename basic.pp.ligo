# 1 "src/basic.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "src/basic.ligo"
type parameter is unit;
type store is unit;
function main(const parameter: parameter; const store: store): (list(operation) * store) is
    block { skip } with ((nil : list(operation)), store)
