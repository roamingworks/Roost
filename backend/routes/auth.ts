import express from "express";
import jwt from "jsonwebtoken";
import { User } from "../models/User";
import bcrypt from "bcryptjs";

const router = express.Router();

router.post("/register", async (req, res) => {
  try {
    const { username, password, role, studentDetails } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);
    const user = new User({
      username,
      password: hashedPassword,
      role,
      studentDetails,
    });
    await user.save();
    res.status(201).json({ message: "User registered successfully" });
  } catch (error) {
    res.status(500).json({ error: "Registration failed" });
  }
});

router.post("/login", async (req, res) => {
  try {
    const { username, password } = req.body;
    const user = await User.findOne({ username });
    if (!user) return res.status(401).json({ error: "Authentication failed" });

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch)
      return res.status(401).json({ error: "Authentication failed" });

    const token = jwt.sign(
      { userId: user._id, role: user.role },
      process.env.JWT_SECRET!,
      { expiresIn: "1h" },
    );

    res.json({ token, role: user.role });
  } catch (error) {
    res.status(500).json({ error: "Login failed" });
  }
});

export default router;
