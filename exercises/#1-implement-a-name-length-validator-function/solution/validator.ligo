const min_length: nat = 5n;

function is_long_enough(const name: string): bool is 
    block { skip } with (size(name) >= min_length)