import express, { RequestHandler } from "express";
import { User } from "../models/user";
import { auth, AuthenticatedRequest } from "../middleware/auth";

const router = express.Router();

const adminMiddleware: RequestHandler = (
  req: AuthenticatedRequest,
  res,
  next,
): void => {
  if (req.userRole !== "admin") {
    res.status(403).json({ error: "Unauthorized" });
  }
  next();
};
// Admin middleware
router.use(auth);
router.use(adminMiddleware);

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
