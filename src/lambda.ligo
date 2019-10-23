type my_lambda is (int -> int)

function add_one(const i: int): int is block {skip} with i + 1

function main (const fn : my_lambda) : int is
  block { skip } 
  with fn(1)