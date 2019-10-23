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