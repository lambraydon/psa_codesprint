const express = require("express");

const router = express.Router();


const { listAllCandidates, searchCandidateByName, searchCandidateByJob, storeCandidate, deleteCandidate, updateCandidateResponse} = require("../controllers/candidateController");

router.get("/", listAllCandidates);

router.post("/searchByName", searchCandidateByName);

router.post("/searchByJob", searchCandidateByJob);

router.post("/addCandidate", storeCandidate);

router.post("/deleteCandidate", deleteCandidate);

router.post("/updateCandidate", updateCandidateResponse);

module.exports = router;