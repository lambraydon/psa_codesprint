const express = require('express');
const app = express();
const connectdb = require("./database/database");
const candidateRoutes = require("./routes/candidateRoutes");
const PORT = process.env.PORT || 3000;

app.use(express.json())

app.get('/', (req, res) => {
    res.send('Hello, World!');
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

try {
    connectdb();
  } catch (error) {
    console.error("Error connecting to the database:", error);
    process.exit(1); 
  }

  app.use("/api/candidates", candidateRoutes);