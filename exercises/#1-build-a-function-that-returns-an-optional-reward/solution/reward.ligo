type reward is option(string);

function is_old_enough(const age: nat): bool is
    block { skip } with age >= 25n

function check_reward(const age: nat): reward is
    block { 
        var reward: reward := None;
        case is_old_enough(age) of 
            | True -> reward := Some("Reward for being old enough")
            | False -> skip
        end
    } with reward