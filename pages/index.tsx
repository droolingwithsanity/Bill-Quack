import React, { useEffect, useState } from 'react';
import BillViewers from '../components/BillViewers';
import BillVisualization from '../components/BillVisualization';
import Biometrics from '../components/Biometrics';
import SideAuth from '../components/SideAuth';
import WebAuthnButton from '../components/WebAuthnButton';
import { faker } from '@faker-js/faker';

const fakeBills = Array.from({ length: 5 }).map(() => ({
  description: faker.commerce.productName(),
  amount: faker.finance.amount(10, 200, 2)
}));
const fakeUsers = Array.from({ length: 5 }).map(() => ({
  id: faker.datatype.uuid(),
  name: faker.name.fullName(),
  email: faker.internet.email()
}));

export default function Home() {
  return (
    <div>
      <h1>AI Billing Dashboard</h1>
      <BillViewers users={fakeUsers} />
      <BillVisualization bills={fakeBills} />
      <Biometrics />
      <SideAuth />
      <WebAuthnButton />
    </div>
  );
}
