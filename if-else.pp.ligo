# 1 "src/if-else.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "src/if-else.ligo"
const min_age: nat = 18n;

(*
    This function is a really obnoxious, but it serves a purpose of
    showcasing how the if statement and it's syntax can be used.

    Normally, you'd do `with (age > min_age)` instead.
*)
function is_adult(const age: nat): bool is 
    block { 
        var is_adult: bool := False;
        if (age >= min_age) then begin
            is_adult := True;
        end else begin
            is_adult := False;
        end
    } with is_adult
