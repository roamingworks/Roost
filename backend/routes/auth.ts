import express, { Request, Response } from "express";
import jwt from "jsonwebtoken";
import { User } from "../models/user";
import bcrypt from "bcryptjs";
import { auth, AuthenticatedRequest } from "../middleware/auth";

const router = express.Router();

router.post("/register", async (req: Request, res: Response): Promise<void> => {
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

router.post("/login", async (req: Request, res: Response): Promise<void> => {
  try {
    const { username, password } = req.body;
    const user = await User.findOne({ username });
    if (!user) {
      res.status(401).json({ error: "Authentication failed" });
      return;
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      res.status(401).json({ error: "Authentication failed" });
      return;
    }

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

router.get("/profile", auth, (async (req: AuthenticatedRequest, res, next) => {

});

export default router;
