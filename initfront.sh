#!/bin/bash

APP_DIR="ai-billing-frontend"
echo "🚀 Creating Next.js app in $APP_DIR..."

npx create-next-app@latest $APP_DIR --typescript --eslint --tailwind --src-dir --app --no-experimental-app --import-alias "@/*" --no-git
cd $APP_DIR

echo "📦 Installing extra packages..."
npm install react-chartjs-2 chart.js @faker-js/faker @simplewebauthn/browser

echo "🛠️ Creating folder structure..."
mkdir -p src/components/layouts src/pages/admin src/pages/guest src/styles

# Create basic layout components
cat <<EOF > src/components/layouts/AdminLayout.tsx
import React from 'react';

export default function AdminLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="p-6 bg-gray-100 min-h-screen">
      <h1 className="text-2xl font-bold mb-4">Admin Portal</h1>
      {children}
    </div>
  );
}
EOF

cat <<EOF > src/components/layouts/GuestLayout.tsx
import React from 'react';

export default function GuestLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="p-6 bg-white min-h-screen">
      <h1 className="text-2xl font-bold mb-4">Customer Portal</h1>
      {children}
    </div>
  );
}
EOF

# Create Admin Portal
cat <<EOF > src/pages/admin/index.tsx
import AdminLayout from "@/components/layouts/AdminLayout";

export default function AdminDashboard() {
  return (
    <AdminLayout>
      <p>Welcome, Admin. This is your dashboard.</p>
    </AdminLayout>
  );
}
EOF

# Create Guest Portal
cat <<EOF > src/pages/guest/index.tsx
import GuestLayout from "@/components/layouts/GuestLayout";

export default function GuestDashboard() {
  return (
    <GuestLayout>
      <p>Hello Guest, here’s your billing overview.</p>
    </GuestLayout>
  );
}
EOF

# Basic index redirect
cat <<EOF > src/pages/index.tsx
import { useEffect } from "react";
import { useRouter } from "next/router";

export default function Home() {
  const router = useRouter();
  useEffect(() => {
    router.push("/guest");
  }, []);
  return null;
}
EOF

# Tailwind CSS setup
cat <<EOF > tailwind.config.js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

cat <<EOF > postcss.config.js
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

cat <<EOF > src/styles/globals.css
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF

# Update _app.tsx
cat <<EOF > src/pages/_app.tsx
import '@/styles/globals.css'
import type { AppProps } from 'next/app'

export default function App({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />
}
EOF

echo "✅ Frontend setup complete."
echo "💡 To start your frontend app:"
echo "cd $APP_DIR && npm run dev"

