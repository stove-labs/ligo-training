# 1 "exercises/#1-implement-an-access-control-function-for-an-elevator/solution/has_access.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "exercises/#1-implement-an-access-control-function-for-an-elevator/solution/has_access.ligo"
type user is
| Admin
| Manager
| Guest;

function has_access(const u: user; const floor_id: nat): bool is block {
    var has_access: bool := False;
    case u of
    | Admin(i) -> has_access := True
    | Manager(i) -> if (floor_id <= 10n) then has_access := True else skip
    | Guest(i) -> if (floor_id <= 3n) then has_access := True else skip
    end
} with has_access
