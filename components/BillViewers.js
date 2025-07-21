import React from 'react';

export default function BillViewers({ users }) {
  return (
    <div>
      <h2>Users</h2>
      <ul>{users.map(u => <li key={u.id}>{u.name} ({u.email})</li>)}</ul>
    </div>
  );
}
