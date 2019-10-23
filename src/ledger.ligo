type ledger is map(address, tez);
const ledger: ledger = map
    ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address) -> 1000mtz;
    ("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN": address) -> 2000mtz;
end

const balance: option(tez) = ledger[("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN": address)];