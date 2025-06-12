// routes/meal.ts
import express from "express";
import { Meal } from "../models/Meal";
import auth from "../middleware/auth";

const router = express.Router();

// Get today's meal plan
router.get("/today", auth, async (req, res) => {
  try {
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    const meal = await Meal.findOne({
      student: req.userId,
      date: {
        $gte: today,
        $lt: new Date(today.getTime() + 24 * 60 * 60 * 1000),
      },
    }).populate("student");

    if (!meal) {
      return res.status(404).json({ message: "No meal plan for today" });
    }

    res.json(meal);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch meal plan" });
  }
});

// Update meal status (skip/on)
router.patch("/status", auth, async (req, res) => {
  try {
    const { mealType, status } = req.body;
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    const meal = await Meal.findOneAndUpdate(
      {
        student: req.userId,
        date: {
          $gte: today,
          $lt: new Date(today.getTime() + 24 * 60 * 60 * 1000),
        },
      },
      { [`status.${mealType}`]: status },
      { new: true, upsert: true },
    );

    res.json(meal);
  } catch (error) {
    res.status(500).json({ error: "Failed to update meal status" });
  }
});

// Get meal stats for the month
router.get("/stats", auth, async (req, res) => {
  try {
    const now = new Date();
    const firstDay = new Date(now.getFullYear(), now.getMonth(), 1);
    const lastDay = new Date(now.getFullYear(), now.getMonth() + 1, 0);

    const meals = await Meal.find({
      student: req.userId,
      date: { $gte: firstDay, $lte: lastDay },
    });

    const stats = {
      breakfast: { total: 0, attended: 0 },
      lunch: { total: 0, attended: 0 },
      teaSnacks: { total: 0, attended: 0 },
      dinner: { total: 0, attended: 0 },
    };

    meals.forEach((meal) => {
      Object.keys(meal.status).forEach((key) => {
        stats[key].total++;
        if (meal.status[key]) stats[key].attended++;
      });
    });

    res.json(stats);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch meal stats" });
  }
});

export default router;
