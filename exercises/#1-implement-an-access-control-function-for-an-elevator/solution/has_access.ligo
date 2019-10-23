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