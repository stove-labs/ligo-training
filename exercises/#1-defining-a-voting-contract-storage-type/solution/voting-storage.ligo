type candidate is record
    yay: nat;
    nay: nat;
end
type voting_storage is map(address, candidate);