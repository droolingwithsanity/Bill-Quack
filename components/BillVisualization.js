import React from 'react';
import { Bar } from 'react-chartjs-2';

export default function BillVisualization({ bills }) {
  const data = {
    labels: bills.map(b => b.description),
    datasets: [{
      label: 'Bill Amounts',
      data: bills.map(b => b.amount),
      backgroundColor: 'rgba(75,192,192,0.4)'
    }]
  };
  return <Bar data={data} />;
}
