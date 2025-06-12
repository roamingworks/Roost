import express from "express";
import { Complaint } from "../models/Complaint";
import auth from "../middleware/auth";
import multer from "multer";

const upload = multer({ dest: "uploads/" });
const router = express.Router();

// Student submits a complaint
router.post("/", auth, upload.single("image"), async (req, res) => {
  try {
    const { title, description } = req.body;
    const complaint = new Complaint({
      title,
      description,
      image: req.file?.path,
      student: req.userId,
    });
    await complaint.save();
    res.status(201).json(complaint);
  } catch (error) {
    res.status(500).json({ error: "Failed to submit complaint" });
  }
});

// Student views their complaints
router.get("/", auth, async (req, res) => {
  try {
    const complaints = await Complaint.find({ student: req.userId }).sort({
      createdAt: -1,
    });
    res.json(complaints);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch complaints" });
  }
});

// Admin views all complaints
router.get("/admin", auth, async (req, res) => {
  try {
    if (req.userRole !== "admin")
      return res.status(403).json({ error: "Unauthorized" });

    const complaints = await Complaint.find()
      .populate(
        "student",
        "studentDetails.name studentDetails.hostel studentDetails.roomNo",
      )
      .sort({ status: 1, createdAt: -1 });

    res.json(complaints);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch complaints" });
  }
});

// Admin updates complaint status
router.patch("/:id", auth, async (req, res) => {
  try {
    if (req.userRole !== "admin")
      return res.status(403).json({ error: "Unauthorized" });

    const { status, adminViewed } = req.body;
    const complaint = await Complaint.findByIdAndUpdate(
      req.params.id,
      { status, adminViewed },
      { new: true },
    );

    res.json(complaint);
  } catch (error) {
    res.status(500).json({ error: "Failed to update complaint" });
  }
});

export default router;
