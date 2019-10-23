# 1 "src/pattern-matching.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "src/pattern-matching.ligo"
type dinner is option(string);
function is_hungry(const dinner: dinner): bool is block { skip } 
    with (
        case dinner of 
            | None -> True
            | Some(d) -> False
        end
    )
