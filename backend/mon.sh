#!/bin/bash

DB_NAME="ai-billing"
MONGO_PORT=27017

echo "🔍 Checking if MongoDB is running..."
if ! pgrep -x "mongod" > /dev/null; then
  echo "🚀 Starting mongod..."
  sudo systemctl start mongod
  sleep 3
else
  echo "✅ mongod is already running."
fi

echo "📡 Creating MongoDB database and collections..."

mongo --port $MONGO_PORT <<EOF
use $DB_NAME;

db.createCollection("users");
db.createCollection("bills");

if (db.users.countDocuments() === 0) {
  db.users.insertMany([
    { name: "Alice", email: "alice@example.com" },
    { name: "Bob", email: "bob@example.com" }
  ]);
  print("✅ Inserted fake users.");
} else {
  print("ℹ️ Users collection already has data.");
}

if (db.bills.countDocuments() === 0) {
  db.bills.insertMany([
    { description: "Hydro", amount: 89.50 },
    { description: "Internet", amount: 59.99 }
  ]);
  print("✅ Inserted fake bills.");
} else {
  print("ℹ️ Bills collection already has data.");
}
EOF

echo "✅ MongoDB database '$DB_NAME' is ready."

