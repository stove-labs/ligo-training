# 1 "src/substraction.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "src/substraction.ligo"
const a: int = 5 - 10;
// substraction of two nats, yields an int
const b: int = 5n - 2n;
// won't compile, result is an int, not a nat
// const c: nat = 5n - 2n;
const d: tez = 5mtz - 1mtz;

const e: string = "Hello" ^ " " ^ "World";
const f: string = string_concat("Hello", "World");
