# 1 "exercises/#1-building-a-simple-ledger/solutions/ledger.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "exercises/#1-building-a-simple-ledger/solutions/ledger.ligo"
type token_id is string;
type balance is nat;
type ledger_entry_map is map(token_id, balance);
type ledger is map(address, ledger_entry_map);

const ledger: ledger = map
    ("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN": address) -> map
        "LIGO" -> 10000n
    end;
end

function get_balance(const address: address; const token_id: token_id): nat is
    block {
        var balance: nat := 0n;
        // get_force gets rid of the optional value and unwraps it right away
        // however this is not the best practice
        const ledger_entry_map: ledger_entry_map = get_force(address, ledger);
        case ledger_entry_map[token_id] of
            | None -> skip
            | Some(retrieved_balance) -> balance := retrieved_balance
        end
    } with balance
