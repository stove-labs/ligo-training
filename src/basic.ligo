type parameter is unit;
type store is unit;
function main(const parameter: parameter; const store: store): (list(operation) * store) is
    block { skip } with ((nil : list(operation)), store)