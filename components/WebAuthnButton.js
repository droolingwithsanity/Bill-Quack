'use client';
import { startAuthentication } from '@simplewebauthn/browser';

export default function WebAuthnButton() {
  const handleAuth = async () => {
    try {
      const result = await startAuthentication({ challenge: 'fake-challenge' });
      console.log(result);
    } catch (err) {
      console.error(err);
    }
  };
  return <button onClick={handleAuth}>Authenticate with WebAuthn</button>;
}
