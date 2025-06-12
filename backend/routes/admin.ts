import express from "express";
import { User } from "../models/User";
import auth from "../middleware/auth";

const router = express.Router();

// Admin middleware
router.use(auth);
router.use((req, res, next) => {
  if (req.userRole !== "admin")
    return res.status(403).json({ error: "Unauthorized" });
  next();
});

// Manage students
router.get("/students", async (req, res) => {
  try {
    const students = await User.find({ role: "student" }).select("-password");
    res.json(students);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch students" });
  }
});

// Update student details
router.put("/students/:id", async (req, res) => {
  try {
    const student = await User.findByIdAndUpdate(
      req.params.id,
      { studentDetails: req.body },
      { new: true },
    ).select("-password");

    res.json(student);
  } catch (error) {
    res.status(500).json({ error: "Failed to update student" });
  }
});

// Other admin endpoints...
export default router;
