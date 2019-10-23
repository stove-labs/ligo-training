# 1 "exercises/#1-access-control-functions/solution/acl.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "exercises/#1-access-control-functions/solution/acl.ligo"
type owners is set(address);
const owners: owners = set
    ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address);
    ("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN": address);
    ("tz1faswCTDciRzE4oJ9jn2Vm2dvjeyA9fUzU": address);
end

function is_owner(const caller: address): bool is 
    block { skip } with owners contains caller;
