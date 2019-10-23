type owners is set(address);
const owners: owners = set
    ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address);
    ("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN": address);
    ("tz1faswCTDciRzE4oJ9jn2Vm2dvjeyA9fUzU": address);
end

function is_owner(const caller: address): bool is 
    block { skip } with owners contains caller;