const express = require('express');
const bodyParser = require('body-parser');
const data=require('./data.json');


const app = express();

// Middleware
app.use(bodyParser.json());

// Routes
app.use('/', (req,res)=>{
  res.status(200).json(data);
});

// Start the server
const PORT = process.env.PORT || 4000;
app.listen(PORT, '0.0.0.0',() => {
  console.log(`Server running on port ${PORT}`);
});
