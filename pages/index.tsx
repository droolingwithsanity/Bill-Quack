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
