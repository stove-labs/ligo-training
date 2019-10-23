# 1 "src/user.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "src/user.ligo"
type user is record 
    id: nat;
    is_admin: bool;
    name: string;
end

const user: user = record
    id = 1n;
    is_admin = True;
    name = "Alice";
end

const is_admin: bool = user.is_admin;
