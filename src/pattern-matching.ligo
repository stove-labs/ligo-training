type dinner is option(string);
function is_hungry(const dinner: dinner): bool is block { skip } 
    with (
        case dinner of 
            | None -> True
            | Some(d) -> False
        end
    )