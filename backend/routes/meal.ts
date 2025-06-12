import express, { RequestHandler, Router } from "express";
import { Meal, IMeal } from "../models/meal";
import { auth, AuthenticatedRequest } from "../middleware/auth";

const router: Router = express.Router();

interface MealStatsResponse {
  breakfast: { total: number; attended: number };
  lunch: { total: number; attended: number };
  teaSnacks: { total: number; attended: number };
  dinner: { total: number; attended: number };
}

// Get today's meal plan
router.get("/today", auth, (async (req: AuthenticatedRequest, res, next) => {
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
      res.status(404).json({ message: "No meal plan for today" });
      return;
    }

    res.json(meal);
  } catch (error) {
    next(error); // Proper error handling with Express
  }
}) as RequestHandler);

// Update meal status (skip/on)
router.patch("/status", auth, (async (req: AuthenticatedRequest, res, next) => {
  try {
    const { mealType, status } = req.body;

    if (!mealType || status === undefined) {
      res.status(400).json({ error: "mealType and status are required" });
      return;
    }

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
    next(error); // Proper error handling with Express
  }
}) as RequestHandler);

// Get meal stats for the month
router.get("/stats", auth, (async (req: AuthenticatedRequest, res, next) => {
  try {
    const now = new Date();
    const firstDay = new Date(now.getFullYear(), now.getMonth(), 1);
    const lastDay = new Date(now.getFullYear(), now.getMonth() + 1, 0);

    const meals = await Meal.find({
      student: req.userId,
      date: { $gte: firstDay, $lte: lastDay },
    });

    const stats: MealStatsResponse = {
      breakfast: { total: 0, attended: 0 },
      lunch: { total: 0, attended: 0 },
      teaSnacks: { total: 0, attended: 0 },
      dinner: { total: 0, attended: 0 },
    };

    meals.forEach((meal) => {
      (Object.keys(meal.status) as Array<keyof IMeal["status"]>).forEach(
        (key) => {
          stats[key].total++;
          if (meal.status[key]) stats[key].attended++;
        },
      );
    });

    res.json(stats);
  } catch (error) {
    next(error); // Proper error handling with Express
  }
}) as RequestHandler);

export default router;
