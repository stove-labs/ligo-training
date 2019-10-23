# 1 "exercises/#1-build-a-function-that-returns-an-optional-reward/solution/reward.ligo"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































# 32 "<command-line>" 2
# 1 "exercises/#1-build-a-function-that-returns-an-optional-reward/solution/reward.ligo"
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
