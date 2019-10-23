type int_list is list(int);
const my_list: int_list = list
    1;
    2;
    3;
end
const larger_list: int_list = cons(4, my_list);
const even_larger_list: int_list = 5 # larger_list;

function increment(const i: int): int is block { skip } with i + 1;
const incremented_list: int_list = list_map(even_larger_list, increment);

function sum(const result: int; const i: int): int is block { skip } with result + i;
const sum_of_a_list: int = list_fold(my_list, 0, sum);