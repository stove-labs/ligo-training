# 1 "src/variant.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "src/variant.ligo"
type id is nat
type user is
| Admin of id
| Manager of id
| Guest;

const u: user = Admin(1000n);
const g: user = Guest(Unit);
