const Mongoose = require("mongoose");

const candidateSchema = new Mongoose.Schema({
  name: {
    type: String,
  },
  resume: {
    type: String,
  },
  response: {
    type: String,
  }, 
  job: {
    type: String
  }
});

module.exports = Mongoose.model("Candidate", candidateSchema);
