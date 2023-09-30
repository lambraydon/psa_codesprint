// database.js

const mongoose = require('mongoose');
require("dotenv").config();

async function connectDB() {
    try {
        await mongoose.connect(process.env.MONGODB_URI);
        console.log('Connected to MongoDB successfully!');
    } catch (error) {
        console.error('Error connecting to MongoDB:', error);
        process.exit(1); // Exit the process with failure
    }
}

module.exports = connectDB;
