const Candidate = require("../models/candidates");

exports.listAllCandidates = async (req, res) => {
    try {
        const candidates = await Candidate.find().sort({ updatedAt: -1 }); 
        res.json(candidates);
    } catch (error) {
        res.status(500).json({ error: "Failed to fetch candidates." });
    }
};

exports.searchCandidateByName = async (req, res) => {
    const keyword = req.query.search
        ? {
              $or: [
                  { name: { $regex: new RegExp(req.query.search), $options: "i" } },
              ],
          }
        : {};

    try {
        const candidates = await Candidate.find(keyword);
        res.json(candidates);
    } catch (error) {
        res.status(500).json({ error: "Failed to search candidates." });
    }
};

exports.searchCandidateByJob = async (req, res) => {
    const keyword = req.query.search
        ? {
              $or: [
                  { name: { $regex: new RegExp(req.query.search), $options: "i" } },
                  { job: { $regex: new RegExp(req.query.search), $options: "i" } },
              ],
          }
        : {};

    try {
        const candidates = await Candidate.find(keyword);
        res.json(candidates);
    } catch (error) {
        res.status(500).json({ error: "Failed to search candidates." });
    }
};

exports.storeCandidate = async (req, res) => {
    console.log(req.body);
    const { name, resume, response, job } = req.body;

    try {
        const newCandidate = new Candidate({ name, resume, response, job });
        await newCandidate.save();
        res.status(201).json(newCandidate);
    } catch (error) {
        res.status(500).json({ error: "Failed to create a candidate." });
    }
};

exports.deleteCandidate = async (req, res) => {
    try {
        await Candidate.findByIdAndRemove(req.body.id);
        res.json({ message: "Candidate deleted successfully!" });
    } catch (error) {
        res.status(500).json({ error: "Failed to delete the candidate." });
    }
};

exports.updateCandidateResponse = async (req, res) => {
    try {
        const candidate = await Candidate.findByIdAndUpdate(
            req.body.id,
            { response: req.body.response },
            { new: true } // Return the updated candidate
        );

        if (!candidate) {
            return res.status(404).json({ message: "Candidate not found!" });
        }

        res.json(candidate);
    } catch (error) {
        res.status(500).json({ error: "Failed to update the candidate's response." });
    }
};