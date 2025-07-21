require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

mongoose.connect(process.env.MONGODB_URI || 'mongodb://localhost:27017/ai-billing', {
  useNewUrlParser: true,
  useUnifiedTopology: true
}).then(() => console.log('MongoDB connected'))
  .catch(err => console.error('Mongo error:', err));

app.get('/api/bills', (req, res) => {
  res.json([
    { id: 1, name: 'Hydro', amount: 89.50 },
    { id: 2, name: 'Internet', amount: 59.99 },
    { id: 3, name: 'Phone', amount: 45.30 },
  ]);
});

app.listen(3001, () => {
  console.log('Backend running on http://localhost:3001');
});
