import React from 'react';

export default function GuestLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="p-6 bg-white min-h-screen">
      <h1 className="text-2xl font-bold mb-4">Customer Portal</h1>
      {children}
    </div>
  );
}
