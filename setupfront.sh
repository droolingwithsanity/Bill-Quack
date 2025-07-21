echo "📦 Initializing frontend..."
npm init -y
npm install next react react-dom chart.js react-chartjs-2 @faker-js/faker @simplewebauthn/browser

echo "📄 Creating tsconfig.json..."
npx tsc --init
touch next-env.d.ts

echo "⚙️ Creating next.config.js..."
cat <<EOF > next.config.js
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
};

module.exports = nextConfig;
EOF

echo "📄 Creating pages/index.tsx..."
cat <<EOF > pages/index.tsx
import dynamic from 'next/dynamic';
import { useEffect, useState } from 'react';
import { faker } from '@faker-js/faker';

const BillViewers = dynamic(() => import('../components/BillViewers'), { ssr: false });
const BillVisualization = dynamic(() => import('../components/BillVisualization'), { ssr: false });
const SideAuth = dynamic(() => import('../components/SideAuth'), { ssr: false });
const Biometrics = dynamic(() => import('../components/Biometrics'), { ssr: false });
const WebAuthnButton = dynamic(() => import('../components/WebAuthnButton'), { ssr: false });

export default function Home() {
  const [users, setUsers] = useState([]);
  const [bills, setBills] = useState([]);

  useEffect(() => {
    setUsers(Array.from({ length: 5 }, () => ({
      id: faker.string.uuid(),
      name: faker.person.fullName(),
      email: faker.internet.email()
    })));

    setBills([
      { description: 'Hydro', amount: 100 },
      { description: 'Internet', amount: 60 },
      { description: 'Phone', amount: 45 },
    ]);
  }, []);

  return (
    <div>
      <h1>AI Billing</h1>
      <BillViewers users={users} />
      <BillVisualization bills={bills} />
      <Biometrics />
      <SideAuth />
      <WebAuthnButton />
    </div>
  );
}
EOF

echo "📦 Setting up components..."

# Component: BillViewers
cat <<EOF > components/BillViewers.js
export default function BillViewers({ users }) {
  return (
    <div>
      <h2>Users</h2>
      <ul>{users.map(u => <li key={u.id}>{u.name} ({u.email})</li>)}</ul>
    </div>
  );
}
EOF

