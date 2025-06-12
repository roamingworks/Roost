import express from "express";
import { Payment } from "../models/Payment";
import auth from "../middleware/auth";
import multer from "multer";

const upload = multer({ dest: "uploads/" });
const router = express.Router();

// Student submits payment
router.post("/", auth, upload.single("photo"), async (req, res) => {
  try {
    const { type, amount } = req.body;
    const payment = new Payment({
      type,
      amount,
      photo: req.file?.path,
      student: req.userId,
    });
    await payment.save();
    res.status(201).json(payment);
  } catch (error) {
    res.status(500).json({ error: "Failed to submit payment" });
  }
});

// Student views their payments
router.get("/", auth, async (req, res) => {
  try {
    const payments = await Payment.find({ student: req.userId }).sort({
      createdAt: -1,
    });
    res.json(payments);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch payments" });
  }
});

// Admin approves payment
router.patch("/:id/approve", auth, async (req, res) => {
  try {
    if (req.userRole !== "admin")
      return res.status(403).json({ error: "Unauthorized" });

    const payment = await Payment.findByIdAndUpdate(
      req.params.id,
      { status: "approved" },
      { new: true },
    );

    res.json(payment);
  } catch (error) {
    res.status(500).json({ error: "Failed to approve payment" });
  }
});

export default router;
