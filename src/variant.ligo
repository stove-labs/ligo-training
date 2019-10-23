type id is nat
type user is
| Admin of id
| Manager of id
| Guest;

const u: user = Admin(1000n);
const g: user = Guest(Unit);