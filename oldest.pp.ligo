# 1 "exercises/#2-find-oldest-person-in-the-list/solution/oldest.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "exercises/#2-find-oldest-person-in-the-list/solution/oldest.ligo"
type person is record
    age: nat;
    name: string;
end
type person_list is list(person);
const person_list: person_list = list
    record
        age = 15n;
        name = "Alice";
    end;
    record
        age = 21n;
        name = "Bob";
    end;
    record
        age = 18n;
        name = "Tom";
    end;
end

function find_oldest(var oldest: option(person); const next_person: person): option(person)
    is block {
        case oldest of
            | None -> oldest := Some(next_person)
            // figure out how to use blocks within pattern matching properly
            // like in timelocked-multisig.ligo
            | Some(oldest_person) -> if next_person.age > oldest_person.age then
                begin
                    oldest := Some(next_person);
                end else skip
        end
    } with oldest;

const oldest_person: option(person) = list_fold(person_list, (None: option(person)), find_oldest);

